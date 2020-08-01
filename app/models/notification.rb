class Notification < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	belongs_to :song, optional: true
	belongs_to :comment, optional: true

	belongs_to :visitor, class_name: "User", forign_key: "visitor_id", optional: true
	belongs_to :visited, class_name: "User", forign_key: "visited_id", optional: true
end
