class Project < ActiveRecord::Base
	# Projects belong to clients 
	belongs_to :client
	# And they also belong to mutliple translators
	has_many :translators, through: :assignments
end
