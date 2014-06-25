class Place < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :title, presence: true

  belongs_to :owner, class_name: "User"
end
