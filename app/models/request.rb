class Request < ActiveRecord::Base
  validates :place_id, presence: true
  validates :applicant_id, presence: true
  
  belongs_to :place, inverse_of: :requests
  belongs_to :applicant, class_name: "User"
  
end
