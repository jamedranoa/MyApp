class Review < ActiveRecord::Base
  validates :maker_id, presence: true
  validates :reviewable_id, presence: true
  validates :reviewable_type, presence: true
  validates :body, presence: true
  
  belongs_to :maker, class_name: "User"
  belongs_to :reviewable, polymorphic: true
end
