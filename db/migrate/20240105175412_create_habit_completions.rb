class CreateHabitCompletions < ActiveRecord::Migration[7.1]
  def change
    create_table :habit_completions do |t|
      t.references :habit, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
    add_index :habit_completions, [:habit_id, :date], unique: true
  end
end
