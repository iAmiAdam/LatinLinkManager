class Asset < ActiveRecord::Base
	belongs_to :project
	has_attached_file :file

	validates_attachment_content_type :file, content_type: {content_type: "text/xml"}
end
