module ApplicationHelper
	def full_title(page_title)
		base_title = "Latin Link Manager"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def wicked_pdf_image_tag_for_public(img, options={})
    if img[0] == "/"
      new_image = img.slice(1..-1)
      image_tag "file://#{Rails.root.join('public', new_image)}", options
    else
      image_tag "file://#{Rails.root.join('assets', 'images', img)}", options
    end
  end
end
