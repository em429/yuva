class ChangeStockToFloatInShoppingItems < ActiveRecord::Migration[7.1]
  def change
    change_column :shopping_items, :stock, :float
  end
end
