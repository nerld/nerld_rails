class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.string :name
      t.integer :pin_type
      t.integer :pin
      t.integer :data_type
      t.float :data_rate
      t.string :data_units

      t.timestamps
    end
  end

  def down
    drop_table :inputs
  end
end
