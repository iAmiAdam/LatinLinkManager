class ProjectMailer < ActionMailer::Base

  def project_email(translator, project, rate, total, handoff, request, message, manager)
  	@translator = translator
  	@project = project

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

	@project.assets.each do |a|
		if a.file_content_type == "application/octet-stream"
			attachments["Kit.zip"] = File.read(a.file.path, mode: 'rb')
		end
	end

	attachments.inline["logo"] = File.read("#{Rails.root.to_s + '/app/assets/images/emaillogo.png'}", mode: "rb")
	
  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(from: from, to: email_with_name, subject: "Handoff #{handoff} | #{request} | #{@project.deadline} #{project.time.strftime("%l:%M")} GMT")

  end
end
