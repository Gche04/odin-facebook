class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.integer :likeable_type
      t.integer :liker_id

      t.timestamps
    end
  end
end
