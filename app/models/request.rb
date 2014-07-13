class Request < ActiveRecord::Base
  validates :place, presence: true
  validate :dates_shouldnt_been_taken
  validates :start_date, presence:true
  validates :end_date, presence: true

  belongs_to :place, inverse_of: :requests
  belongs_to :applicant, class_name: "User", inverse_of: :made_requests

  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy

  after_create :notificate_request
  after_update :notificate_response

  def dates_shouldnt_been_taken
    return false if ([ place,start_date, end_date ].any?(&:blank?))
    if (place.reserved_days & ((start_date..end_date).to_a)) != [] && !approved
      errors.add(:place,"dates doesnt work")
    end
  end

  def dates
    (self.start_date..self.end_date).to_a
  end

  private

  def notificate_request
      notification = self.notifications.unread.event(:new_request).new
      notification.user = self.place.owner
      notification.save
  end

  def notificate_response
    notification = self.notifications.unread.event(:new_response).new
    notification.user = self.applicant
    notification.save
  end


end
