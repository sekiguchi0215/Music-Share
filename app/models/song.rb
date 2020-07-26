class Song < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :user
	attachment :image

	validates :title, presence: true
	validates :artist_name, presence: true
	validates :body, presence: true
end
