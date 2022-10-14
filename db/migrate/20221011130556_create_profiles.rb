class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :other_name
      t.string :gender
      t.string :country

      t.timestamps
    end
  end
end
