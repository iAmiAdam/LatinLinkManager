class ProjectMailer < ActionMailer::Base

  def project_email(translator, project, rate, total, handoff, request, message, manager, order, asset)
  	@translator = translator
  	@project = project

  	@asset = asset

  	@words = Breakdown.new
	@percents = Breakdown.new

	@breakdowns = @project.breakdowns
	@breakdowns.each do |b|
		if b.sort == 1
			@words = b
		else
			@percents = b
		end
	end
	
	@rate = rate.to_f

	@total = total.to_f

	from = "#{manager.name} <#{manager.email}>"

	@signature = manager.signature

	@message = message
	
	
	attachments[@asset.file_file_name] = open(@asset.file.url).read()
	

	attachments.inline["logo"] = File.read("#{Rails.root.to_s + '/app/assets/images/emaillogo.png'}", mode: "rb")
	attachments.inline["footer_logo"] = File.read("#{Rails.root.to_s + '/app/assets/images/emailfooterlogo.jpg'}", mode: "rb")
	
  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(from: from, to: email_with_name, subject: "Handoff #{handoff} | #{request} | #{@project.translator_deadline} #{project.translator_time.strftime("%H:%M")} GMT | Purchase Order: #{order}")

  end
end
