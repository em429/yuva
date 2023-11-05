class CreateShoppingItems < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_items do |t|
      t.string :title, limit: 20
      t.integer :status, default: 0
      t.references :shopping_category, null: false, foreign_key: true
      t.text :notes
      t.integer :importance, default: 1
      t.string :unit, default: "kg"

      t.timestamps
    end
    add_index :shopping_items, :title, unique: true
  end
end
