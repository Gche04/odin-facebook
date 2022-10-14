class Attachment < ApplicationRecord
    validates :image, attached: true
    validates :user_id, presence: true

    belongs_to :user
    has_many_attached :images
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
end
