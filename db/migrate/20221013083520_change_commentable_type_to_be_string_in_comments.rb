class ChangeCommentableTypeToBeStringInComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :commentable_type, :string
  end
end
