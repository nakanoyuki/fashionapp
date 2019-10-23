class AddMaterialToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :material, :string
  end
end
