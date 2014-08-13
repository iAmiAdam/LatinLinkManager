class Order < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
	validates :LLID, presence: true
	validates :value, presence: true
	validates :category, presence: true
end
