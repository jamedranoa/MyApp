class Place < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :title, presence: true

  belongs_to :owner, class_name: "User"

  has_many :reserved_dates

  has_many :requests, dependent: :destroy


  has_many :place_pics, dependent: :destroy

  geocoded_by :full_address
  after_validation :geocode

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

  def compatible_dates(dates)
    (self.reserved_days & dates).empty?
  end

  def full_address
    "#{self.address}, #{self.city}, #{self.country}"
  end

end
