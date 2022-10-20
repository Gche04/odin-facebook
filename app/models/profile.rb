class Profile < ApplicationRecord
    validates :user_id, presence: true
    validate :acceptable_avatar


    belongs_to :user
    has_one_attached :avatar

    private

    def acceptable_avatar
        return unless avatar.attached?
      
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(avatar.content_type)
          errors.add(:avatar, "must be a JPEG or PNG")
        end
    end
end
