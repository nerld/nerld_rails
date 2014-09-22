class AddControllableAttributesToRemoteLabs < ActiveRecord::Migration
  def change
    add_column :remote_labs, :password, :string
    add_column :remote_labs, :allowable_time, :integer
  end

  def down
    remove_column :remote_labs, :password
    remove_column :remote_labs, :allowable_time
  end
end
