class CreateRemoteLabs < ActiveRecord::Migration
  def change
    create_table :remote_labs do |t|
      t.string :title
      t.float :version
      t.string :author
      t.string :school
      t.integer :user_id

      t.timestamps
    end
  end
end
