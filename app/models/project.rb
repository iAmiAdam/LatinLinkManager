class Project < ActiveRecord::Base
	# Projects belong to clients 
	belongs_to :client

	has_many :assignments
	has_many :notes
	has_many :assets
	has_many :links
	accepts_nested_attributes_for :assets
end