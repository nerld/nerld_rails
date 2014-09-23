class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.string :name
      t.integer :pin_type
      t.integer :pin
      t.integer :data_type
      t.string :data_parameters
      t.integer :remote_lab_id

      t.timestamps
    end
  end
end
