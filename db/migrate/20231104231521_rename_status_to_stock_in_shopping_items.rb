class RenameStatusToStockInShoppingItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :shopping_items, :status, :stock
  end
end
