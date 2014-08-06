class ProjectMailer < ActionMailer::Base
  default from: "iamiadam@gmail.com"

  def project_email(translator, project, rate, total)
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

	@signature = current_user.signature
	
  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(to: email_with_name, subject: "Handoff number | request | #{@project.deadline} #{project.time.strftime("%l:%M")}")
  end
end
