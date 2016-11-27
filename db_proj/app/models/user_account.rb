require 'bcrypt'
class UserAccount < ActiveRecord::Base
	before_save { email.downcase! }
	include BCrypt
	has_secure_password
	  validates :password, length: { minimum: 6}
	validates :username, presence: true, length: { maximum: 50 },
		uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

end
