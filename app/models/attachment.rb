class Attachment < ApplicationRecord
    #validates :image, attached: true
    validates :user_id, presence: true
    #validate :acceptable_attachment

    belongs_to :user
    has_many_attached :images
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy


    private
    def acceptable_attachment
        unless images.attached?
            errors.add(:images, "must be present")
        end
      
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(images.content_type)
            errors.add(:images, "must be a JPEG or PNG")
        end
    end
end
