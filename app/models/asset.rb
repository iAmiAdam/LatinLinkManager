class Asset < ActiveRecord::Base
	belongs_to :project
	has_attached_file :file, storage: :s3, default_style: :original, s3_permissions: :authenticated_read

	
	validates_attachment_file_name :file, :matches => [/xml\Z/, /XML\Z/, /zip\Z/, /ZIP\Z/]
	do_not_validate_attachment_file_type :file
end
