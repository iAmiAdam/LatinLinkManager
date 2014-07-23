class Project < ActiveRecord::Base
	# Projects belong to clients 
	belongs_to :client

	has_many :assignments, foreign_key: "tid", dependent: :destroy
	# And they also belong to mutliple translators
	has_many :translators, through: :assignments

	has_many :assets

end
