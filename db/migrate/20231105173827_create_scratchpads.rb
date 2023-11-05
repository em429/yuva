class CreateScratchpads < ActiveRecord::Migration[7.1]
  def change
    create_table :scratchpads do |t|
      t.text :contents

      t.timestamps
    end
  end
end
