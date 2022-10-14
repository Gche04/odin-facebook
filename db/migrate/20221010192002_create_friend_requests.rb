class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.integer :request_sender_id
      t.integer :request_receiver_id

      t.timestamps
    end
  end
end
