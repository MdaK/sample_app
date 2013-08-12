class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :nom, :email, :password, :password_confirmation
	devise :database_authenticatable, :registerable, :recoverable,
 :rememberable, :trackable, :validatable, :authentication_keys => [:login]
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :nom, :presence => true,
					:length => { :maximum => 50 }
	validates :email, :presence => true,
					  :format => { :with => email_regex},
					  :uniqueness => true
	validates :password, :presence => true,
						 :confirmation => true,
						 :length => {:within => 6..40}
	before_save :encrypt_password

	def has_password?(sub_password)
		encrypted_password == encrypt(sub_password)
	end

	def self.authenticate(email, sub_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(sub_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		return nil if user.nil?
		return user if user.salt == cookie_salt
	end

	private

	def encrypt_password
		self.salt = make_salt if new_record?
		self.encrypted_password = encrypt(password)
	end

	def encrypt(string)
		secure_hash("#{salt}--#{string}")
	end

	def make_salt
		secure_hash("#{Time.now.utc}--#{password}")
	end

	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end


end
