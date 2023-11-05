class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, limit: 30
      t.text :description

      t.timestamps
    end
    add_index :recipes, :title, unique: true
  end
end
