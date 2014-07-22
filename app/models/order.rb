class Order < ActiveRecord::Base
	validates :LLID, presence: true
	validates :value, presence: true
	validates :category, presence: true
end
