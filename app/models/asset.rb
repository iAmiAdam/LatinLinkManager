class Asset < ActiveRecord::Base
	belongs_to :project
	has_attached_file :file

	validates_attachment_content_type :file, :content_type => ["application/pdf", "text/xml"]
end
