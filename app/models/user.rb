class User < ActiveRecord::Base
  has_secure_password

  has_many :events
  has_many :event_participants

  has_many :joined_events, through: :event_participants,
  				 source: :event
  
  before_create { generate_token(:auth_token) }

  attr_accessible :email, :password, :password_confirmation,
  								:username

  # validates_uniqueness_of :username, presence: true, length : { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
