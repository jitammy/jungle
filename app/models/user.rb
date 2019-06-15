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
  validates :first_name, :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }


end
