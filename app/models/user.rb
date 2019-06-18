class User < ActiveRecord::Base
  
  has_secure_password

  def self.table_name
    'users'
  end

  has_many :reviews, foreign_key: :user_id
  
  # # To implement parts of has_secure_password yourself
  # attr_accessor :password
  
  # before_save {
  #   self.password_digest = User.digest(password)
  # }

  # # Returns the hash digest of the given string.
  # def self.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end


  before_save { self.email = email.downcase }
  # validates :first_name, :last_name,  presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  # validates :password, length: { minimum: 6 }
  # validates :password_confirmation, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true	 
  validates :email, presence: true	  
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      user
    end
  end
end


