class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :accessibility
    end
  end

  def down
    drop_table :members
  end
end
