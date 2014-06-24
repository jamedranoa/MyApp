class User < ActiveRecord::Base
  attr_reader :password

  validates :password_digest, presence: true
  validates :password, length:{minimum: 6, allow_nil: true}
  validates :session_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :fname, presence: true

  before_validation :ensure_session_token

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

end
