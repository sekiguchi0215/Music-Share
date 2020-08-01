class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true
end
