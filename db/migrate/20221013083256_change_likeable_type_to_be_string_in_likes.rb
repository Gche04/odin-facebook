class ChangeLikeableTypeToBeStringInLikes < ActiveRecord::Migration[7.0]
  def change
    change_column :likes, :likeable_type, :string
  end
end
