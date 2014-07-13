class Notification < ActiveRecord::Base
  include Rails.application.routes.url_helpers

    EVENTS = {
      1 => :new_user_review,
      2 => :new_place_review,
      2 => :new_request,
      3 => :new_response
    }

    EVENT_IDS = EVENTS.invert

    belongs_to :user, inverse_of: :notifications, counter_cache: true
    belongs_to :notifiable, inverse_of: :notifications, polymorphic: true, counter_cache: true

    validates :event_id, inclusion: { in: EVENTS.keys }
    validates :is_read, inclusion: { in: [true, false] }
    validates :notifiable, :user, presence: true

    scope :read, -> { where(is_read: true) }
    scope :unread, -> { where(is_read: false) }
    scope :event, ->(event_name) { where(event_id: EVENT_IDS[event_name]) }

    def url
      case self.event_name
      when :new_comment_on_cat
        comment = self.notifiable
        cat_url(comment.cat_id)
      end
    end

    def text
      case self.event_name
      when :new_comment_on_cat
        comment = self.notifiable
        comment_user = comment.user
        cat = comment.cat

        "#{comment_user.name} commented on your cat #{cat.name}"
      end
    end

    def event_name
      EVENTS[self.event_id]
    end

    def default_url_options
      options = {}
      options[:host] = Rails.env.production? ? "appacademy.io" : "localhost:3000"
      options
    end
end
