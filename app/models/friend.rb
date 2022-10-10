class Friend < ApplicationRecord
    validates :user_id, :users_friend_id, presence: true

    belongs_to :user
    belongs_to :users_friend, class_name: "User"

end
