class ProjectMailer < ActionMailer::Base
  default from: "iamiadam@gmail.com"

  def project_email(translator, project, rate, total, handoff, request, message, signature)
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

	@signature = signature

	@message = message

	attachments.inline["logo"] = File.read("#{Rails.root.to_s + '/app/assets/images/emaillogo.png'}", mode: "rb")

  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(to: email_with_name, subject: "Handoff #{handoff} | #{request} | #{@project.deadline} #{project.time.strftime("%l:%M")} GMT")
  end
end
