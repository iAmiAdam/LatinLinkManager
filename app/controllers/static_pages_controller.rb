class StaticPagesController < ApplicationController
	before_action :signed_in_user

	def home

		date = Date.today
		month = date.strftime('%m')
		year = date.strftime('%Y')
		continue = true

		while continue 
			time = Time.new(year, month)
			@projects = Project.where(:created_at => time.beginning_of_month..time.end_of_month).order("updated_at DESC")
			if @projects.size > 0
				tempmonth = month.to_f
				tempmonth -= 1
				if (tempmonth == 0)
					tempmonth = 12
					tempyear = year.to_f
					tempyear -= 1 
					year = tempyear.to_s
				end
				month = tempmonth.to_s
			else 
				@months = month.to_i + 1
				continue = false
			end
		end


		if (params[:month])
			time = Time.new(Time.now.year, params[:month])
			@projects = Project.where(:created_at => time.beginning_of_month..time.end_of_month).order("updated_at DESC")
			@deadlines = Project.where(:deadline => time.beginning_of_month..time.end_of_month).order("deadline DESC")
			@open = Project.where(:deadline => time.beginning_of_month..time.end_of_month, :closed => false).order("deadline DESC")
			@closed = Project.where(:deadline => time.beginning_of_month..time.end_of_month, :closed => true).order("updated_at DESC")
		else 
			@projects = Project.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).order("updated_at DESC")
			@deadlines = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month).order("deadline DESC")
			@open = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month, :closed => false).order("deadline DESC")
			@closed = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month, :closed => true).order("updated_at DESC")
		end
		@assignments
		if @projects.size > 0
			@projects.each do |p|
				@links = p.links
				@links.each do |l|
					@orders = @orders.to_a.push Order.find(l.order_id)
				end

				if p.assignments != nil
					@assigns = p.assignments
					@assigns.each do |ass|
						@assignments = @assignments.to_a.push ass
						@translators = @translators.to_a.push Translator.find(ass.translator_id)
					end
				end
			end

			@revenue = 0
			@cost = 0
			if @orders != nil
				@orders.each do |o|
					if o.category == 0
						@revenue += o.value.to_f
					else 
						@cost += o.value.to_f
					end
				end
			end
		end
	end

	private

		def signed_in_user
  			redirect_to signin_url, notice: "Please Sign in." unless signed_in?
  		end
end
