class Translator < ActiveRecord::Base
	before_save { self.email =  email.downcase }
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false}
	validates :rate, presence: true

	belongs_to :assignment

	def search
		self.find_translators
	end

	private

	def find_translators
		Translator.find(:all, :conditions => conditions)
	end

	def name_conditions
		["translators.name LIKE ?", "%#{name}"] unless name.blank?
	end

	def rate_conditions
		["translators.rate LIKE ?", "%#{rate}"] unless rate.blank?
	end
end
