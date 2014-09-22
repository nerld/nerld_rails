class AddYunServerToRemoteLabs < ActiveRecord::Migration
  def change
    add_column :remote_labs, :yun_server, :string
  end
end
