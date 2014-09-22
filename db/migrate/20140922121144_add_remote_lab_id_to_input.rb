class AddRemoteLabIdToInput < ActiveRecord::Migration
  def change
    add_column :inputs, :remote_lab_id, :integer
  end
end
