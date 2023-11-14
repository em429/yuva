class RemoveUnitFromShoppingItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :shopping_items, :unit
  end
end
