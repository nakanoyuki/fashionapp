class AddIndexToItemUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :item_users, [:item_id, :user_id], unique: true
  end
end
