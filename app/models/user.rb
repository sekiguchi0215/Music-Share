class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  default_scope -> { order(created_at: :desc) }

  has_many :songs, dependent: :destroy # 投稿機能
  has_many :comments, dependent: :destroy # コメント機能
  has_many :favorites, dependent: :destroy # いいね機能
  has_many :favorite_songs, through: :favorites, source: :song # いいね機能

  # フォロー機能
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  # フォロー機能
  
  # 検索機能
  def self.search(search)
    if search
      User.where("name LIKE(?)", "%#{search}%")
    else
      User.all
    end
  end
  # 検索機能

  # 通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy # 自分からの通知
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy # 相手からの通知

  # フォローしたときの通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?", current_user.id, id, "follow"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: "follow"
      )
      notification.save if notification.valid?
    end
  end
  # フォローしたときの通知
  # 通知機能

end










