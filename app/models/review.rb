class Review < ActiveRecord::Base
  validates :maker_id, presence: true
  validates :reviewable_id, presence: true
  validates :reviewable_type, presence: true
  validates :body, presence: true

  belongs_to :maker, class_name: "User"
  belongs_to :reviewable, polymorphic: true

  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy

  after_create :set_notification

  private

  def set_notification
    user = self.reviewable_type == "User" ? self.reviewable : self.reviewable.owner
    event = self.reviewable_type == "User" ? :new_user_review : :new_place_review
    notification=self.notifications.unread.event(event).new
    notification.user = user
    notification.save
  end


end
