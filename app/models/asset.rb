class Asset < ActiveRecord::Base
	belongs_to :project
	has_attached_file :file

	
	validates_attachment_file_name :file, :matches => [/xml\Z/, /zip\Z/]
	do_not_validate_attachment_file_type :file
end
