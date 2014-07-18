class Translator < ActiveRecord::Base
	before_save { self.email =  email.downcase }
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false}
	validates :rate, presence: true
end
