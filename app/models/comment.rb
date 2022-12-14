class Comment < ApplicationRecord
    validates :body, :commentable_id, :commentable_type, :commenter_id, presence: true

    belongs_to :commentable, polymorphic: true
    belongs_to :commenter, class_name: "User"
end
