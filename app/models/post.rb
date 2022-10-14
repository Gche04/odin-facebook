class Post < ApplicationRecord
    validates :user_id, :body, presence: true

    belongs_to :user
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
end
