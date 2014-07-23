class Asset < ActiveRecord::Base
	belongs_to :project
	has_attached_file :file
end
