class ProjectMailer < ActionMailer::Base
  default from: "info@latinlink.com"

  def project_email(translator, project)
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
  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(to: email_with_name, subject: "Handoff #{}, request, deadline")
  end
end
