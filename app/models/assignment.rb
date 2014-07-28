class Assignment < ActiveRecord::Base
	belongs_to :project
	has_one :translator
end
