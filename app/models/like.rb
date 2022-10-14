class Like < ApplicationRecord
    #validates :likeable_id, :liker_id, presence: true
    validates :likeable_id, :likeable_type, :liker_id, presence: true

    belongs_to :likeable, polymorphic: true
    belongs_to :liker, class_name: "User"
end
