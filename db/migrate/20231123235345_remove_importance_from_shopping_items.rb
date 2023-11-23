class RemoveImportanceFromShoppingItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :shopping_items, :importance, :integer
  end
end
