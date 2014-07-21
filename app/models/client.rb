class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :contact, presence: true
end
