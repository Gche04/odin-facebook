class User < ApplicationRecord
  validates :username, presence: true

  has_one :profile, dependent: :destroy
  has_many :friends
  has_many :sent_friend_requests, foreign_key: "request_sender_id", class_name: "Friend_request"
  has_many :received_friend_requests, foreign_key: "request_receiver_id", class_name: "Friend_request"
  has_many :posts
  has_many :attachments
  has_many :given_comments, foreign_key: "commenter_id", class_name: "Comment"
  has_many :given_likes, foreign_key: "liker_id", class_name: "Like"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
