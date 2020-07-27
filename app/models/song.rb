class Song < ApplicationRecord

	has_many :comments, dependent: :destroy
	belongs_to :user
	has_many :favorites
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
	# has_many :favorited_users, through: :favorites, source: :user
	attachment :image

	validates :title, presence: true
	validates :artist_name, presence: true
	validates :body, presence: true
end
