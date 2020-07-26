class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :comment, presence: true
end
