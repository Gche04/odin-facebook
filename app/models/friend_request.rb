class FriendRequest < ApplicationRecord
    validates :request_sender_id, :request_receiver_id, presence: true

    belongs_to :request_sender, class_name: "User"
    belongs_to :request_receiver, class_name: "User"
end
