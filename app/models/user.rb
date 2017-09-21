class User < ApplicationRecord
	attr_accessor :password, :password_confirmation
	has_and_belongs_to_many :skills
	has_many :project_users
  has_many :projects, through: :project_users
  has_attached_file :image, styles: { :medium => "640x" }


	validates :name,presence: true, length: { minimum: 2 }
  validates :password, presence: true, allow_nil: true
	validates_length_of :password, minimum: 6
  validates_confirmation_of :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates_attachment :image, presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
  	if password.present?
    	self.salt = BCrypt::Engine.generate_salt
    	self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  	end
	end

	def clear_password
  	self.password = nil
	end

	def self.authenticate(email="", login_password="")
  	if  VALID_EMAIL_REGEX.match(email)
    	user = User.find_by_email(email)
  	end
  	if user && user.match_password(login_password)
    	return user
  	else
    return false
    end
  end

  def match_password(login_password="")
  	encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
	end


end
