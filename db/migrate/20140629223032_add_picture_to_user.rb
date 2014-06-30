class AddPictureToUser < ActiveRecord::Migration
  def up
    remove_column :users, :picture
    add_attachment :users, :picture
  end
  
  def down
    remove_attachment :users, :picture
    add_column :users, :picture
  end
  
end
