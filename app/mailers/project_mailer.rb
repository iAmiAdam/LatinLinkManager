class ProjectMailer < ActionMailer::Base
  default from: "iamiadam@gmail.com"

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
	@assignment = Assignment.where(:translator_id => @translator.id, :project_id => @project.id)
	@rate = @assignment.rate
	@link = Link.where(:translator_id => @translator.id, :project_id => @project.id)
	@order = Order.find(@link.order_id)
	@total = @order.value


  	email_with_name = "#{@translator.name} <#{@translator.email}>"
  	mail(to: email_with_name, subject: "Handoff number | request | #{@project.deadline} #{project.time.strftime("%l:%M")}")
  end
end
