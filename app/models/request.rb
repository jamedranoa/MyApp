class Request < ActiveRecord::Base
  validates :place, presence: true
  validate :dates_shouldnt_been_taken
  validates :start_date, presence:true
  validates :end_date, presence: true

  belongs_to :place, inverse_of: :requests
  belongs_to :applicant, class_name: "User", inverse_of: :made_requests

  def dates_shouldnt_been_taken
    return false if ([place,start_date,end_date].any?(&:blank?))
    if (place.reserved_days & ((start_date..end_date).to_a)) != [] && !approved
      errors.add(:place,"dates doesnt work")
    end
  end

  def dates
    (self.start_date..self.end_date).to_a
  end

end
