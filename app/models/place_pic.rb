class PlacePic < ActiveRecord::Base
  has_attached_file :picture, styles: {small: "150x150>", large: "300x300>"}
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :picture
end
