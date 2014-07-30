class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :contact, presence: true

	has_many :projects, dependent: :destroy
	has_many :links
end
