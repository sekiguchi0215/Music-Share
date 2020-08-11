class Song < ApplicationRecord

	default_scope -> { order(created_at: :desc) }

	attachment :image
	
	validates :title, presence: true
	validates :artist_name, presence: true
	validates :body, presence: true

	belongs_to :user
	has_many :comments, dependent: :destroy
	
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			Song.where("title LIKE(?) OR body LIKE(?) OR artist_name LIKE(?)", "%#{search}%", "%#{search}%", "%#{search}%")
		else
			Song.all
		end
	end

	# 通知機能
	has_many :notifications, dependent: :destroy

	# いいねの通知 
	def create_notification_favorite!(current_user)
		temp = Notification.where(["visitor_id = ? and visited_id = ? and song_id = ? and action = ? ", current_user.id, user_id, id, "favorite"])

		if temp.blank?
			notification = current_user.active_notifications.new(
				song_id: id,
				visited_id: user_id,
				action: "favorite"
			)
			if notification.visitor_id == notification.visited_id
				notification.checked = true
			end
			notification.save if notification.valid?
		end
	end
	# いいねの通知

	# コメントの通知
	def create_notification_comment!(current_user, comment_id)
		temp_ids = Comment.select(:user_id).where(song_id: id).where.not(user_id: current_user.id).distinct
		temp_ids.each do |temp_id|
			save_notification_comment!(current_user, comment_id, temp_id["user_id"])
		end
		save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
	end
	
	def save_notification_comment!(current_user, comment_id, visited_id)
		notification = current_user.active_notifications.new(
			song_id: id,
			comment_id: comment_id,
			visited_id: visited_id,
			action: "comment"
		)
		if notification.visitor_id == notification.visited_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end
	# コメントの通知

end













