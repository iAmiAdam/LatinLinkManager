class ProjectMailer < ActionMailer::Base
  default from: current_user.email

  def project_email(translator)
  	@translator = translator
  	mail(to: @translator.email, subject: "")
  end
end
