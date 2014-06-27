class Place < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :title, presence: true

  belongs_to :owner, class_name: "User"
  has_many :reserved_dates
  has_many :requests, dependent: :destroy

  def reserved_days
    self.reserved_dates.pluck(:day)
  end

  def reserve_dates(request)
    req_dates = request.dates
    self.requests.each do |prev_req|
      next if prev_req == request
      if (prev_req.dates & req_dates) != []
        prev_req.approved = false
        prev_req.save
      end
    end
    req_dates.each do |date|
      self.reserved_dates.create!(day: date)
    end
  end

end
