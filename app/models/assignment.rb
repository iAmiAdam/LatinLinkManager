class Assignment < ActiveRecord::Base
	belongs_to :project, class_name: "Project"
	belongs_to :translator, class_name: "Translator"
	validates :pid, :tid, presence: true
end
