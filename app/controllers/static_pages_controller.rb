class StaticPagesController < ApplicationController
	before_action :signed_in_user

	def home
		@projects = Project.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).order("updated_at DESC")
		@deadlines = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month).order("deadline DESC")
		@open = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month, :closed => false).order("deadline DESC")
		@closed = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month, :closed => true).order("updated_at DESC")

		@projects.each do |p|
			@links = p.links
			@links.each do |l|
				@orders = @orders.to_a.push Order.find(l.order_id)
			end
		end

		@revenue = 0
		@cost = 0
		@orders.each do |o|
			if o.category == 0
				@revenue += o.value.to_f
			else 
				@cost += o.value.to_f
			end
		end
	end

	private

		def signed_in_user
  			redirect_to signin_url, notice: "Please Sign in." unless signed_in?
  		end
end
