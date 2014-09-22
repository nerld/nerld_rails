class AddLabTypeToRemoteLabs < ActiveRecord::Migration
  def change
    add_column :remote_labs, :lab_type, :integer
  end
end
