class CreateShoppingCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_categories do |t|
      t.string :title, limit: 20
      t.string :color, default: "white"
      t.text :notes
      t.integer :importance, default: 1

      t.timestamps
    end
    add_index :shopping_categories, :title, unique: true
  end
end
