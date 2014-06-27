class User < ActiveRecord::Base
  attr_reader :password

  validates :password_digest, presence: true
  validates :password, length:{minimum: 6, allow_nil: true}
  validates :session_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :fname, presence: true

  before_validation :ensure_session_token
  before_validation :ensure_picture

  has_many :places, foreign_key: :owner_id, dependent: :destroy
  has_many :requests, through: :places
  has_many :made_requests,class_name: "Request",foreign_key: :applicant_id, dependent: :destroy
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def password=(pass)
    if pass.present?
      @password = pass
      self.password_digest = BCrypt::Password.create(pass)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def self.find_by_credentials(email, password)
     user = User.find_by_email(email)
     user.try(:is_password?, password) ? user : nil
  end
  
  def ensure_picture
    self.picture ||= "http://goo.gl/DegTzj"
  end



end
