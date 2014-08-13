class Project < ActiveRecord::Base
	# Projects belong to clients 
	belongs_to :client
	default_scope -> { order('created_at DESC') }
	has_many :assignments, dependent: :destroy
	has_many :notes, dependent: :destroy
	has_many :assets, dependent: :destroy
	has_many :links, dependent: :destroy
	has_many :breakdowns, dependent: :destroy
	accepts_nested_attributes_for :assets
end