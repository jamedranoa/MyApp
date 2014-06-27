class Request < ActiveRecord::Base

  validates :start_date, presence:true
  validates :end_date, presence: true
  
  belongs_to :place, inverse_of: :requests
  belongs_to :applicant, class_name: "User"
  
  def dates_shouldnt_been_taken
    place
  end
  
end
