class PlacePic < ActiveRecord::Base
  has_attached_file :picture, styles: {small: "150x150>", large: "1000x1000>"}, default_url:"/images/missing_house.jpg"
  #validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  belongs_to :place
end
