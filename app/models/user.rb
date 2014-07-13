class User < ActiveRecord::Base
  attr_reader :password

  has_attached_file :picture, styles: {small: '60x60#', large: '200x200#'}, default_url: "/images/missing.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

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

  has_many :made_reviews, class_name: "Review", foreign_key: :maker_id
  has_many :reviews, as: :reviewable, inverse_of: :reviewable, dependent: :destroy

  has_many :notifications,inverse_of: :user, dependent: :destroy


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
    self.picture ||= proccess_uri"http://goo.gl/DegTzj"
  end

  def self.find_or_create_by_fb(auth_hash)
    user = self.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])

    unless user
      user = self.create!(
        uid: auth_hash[:uid],
        provider: auth_hash[:provider],
        email: auth_hash[:info][:email],
        picture: process_uri(auth_hash[:info][:image]),
        fname: auth_hash[:info][:first_name],
        password_digest: SecureRandom::urlsafe_base64(16)
      )
    end

    user
  end

  def member_since
    self.created_at.to_date.to_formatted_s(:long)
  end

  private

  def self.process_uri(uri)
    require "open-uri"
    require 'open_uri_redirections'

    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end




end
