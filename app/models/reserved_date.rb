class ReservedDate < ActiveRecord::Base
  validates :place_id, presence: true
  validates :day, presence: true
  validates_uniqueness_of :place_id, scope: [:day]
  
  belongs_to :place
end
