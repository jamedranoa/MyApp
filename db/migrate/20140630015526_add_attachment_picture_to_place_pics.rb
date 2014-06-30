class AddAttachmentPictureToPlacePics < ActiveRecord::Migration
  def self.up
    change_table :place_pics do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :place_pics, :picture
  end
end
