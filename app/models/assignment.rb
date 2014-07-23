class Assignment < ActiveRecord::Base
	validates :pid, :tid, presence: true
end
