class ProjectMailer < ActionMailer::Base
  default from: "info@latinlink.com"

  def project_email(translator, project)
  	@translator = translator
  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(to: email_with_name, subject: "Handoff #{}, request, deadline")
  end
end
