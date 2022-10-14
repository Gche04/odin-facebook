class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.integer :user_id
      t.text :caption

      t.timestamps
    end
  end
end
