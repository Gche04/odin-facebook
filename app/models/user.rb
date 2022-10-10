class User < ApplicationRecord
  validates :username, presence: true

  has_many :friends
  has_many :sent_friend_requests, foreign_key: "request_sender_id", class_name: "Friend_request"
  has_many :received_friend_requests, foreign_key: "request_receiver_id", class_name: "Friend_request"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
