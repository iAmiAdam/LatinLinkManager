class ProjectsController < ApplicationController

	before_action :signed_in_user

	def index
		@projects = Project.paginate(:per_page => 10, page: params[:page]).order('created_at DESC')
	end

	def show 
		@project = Project.find(params[:id])
		@assets = @project.assets
		@asset = Asset.new
		@client = @project.client
		@assignment = Assignment.new
		@assignments = @project.assignments
		@assignments.each do |ass|
			@translators = @translators.to_a.push Translator.find(ass.translator_id)
		end
		@notes = @project.notes
		@note = Note.new
		@neworder = Order.new

		@links = @project.links
		@links.each do |l|
			@orders = @orders.to_a.push Order.find(l.order_id)
		end

		@breakdown = Breakdown.new

		@percents = Breakdown.new

		@breakdowns = @project.breakdowns
		@breakdowns.each do |b|
			if b.sort == 1
				@words = b
			else
				@percents = b
			end
		end

		@value = 0
		@cost = 0

		if @orders
			@orders.each do |o|
				if o.category == 0
					@value += o.value.to_f
				else
					@cost += o.value.to_f
				end
			end
		end

		@orderlink = Link.new
	end

	def new
		@project = Project.new
	end

	def send_email
		@translator = Translator.find(params[:translator_id])
		@project = Project.find(params[:project_id])

		@assignments = @project.assignments

		@rate = 0

		@assignments.each do |a|
			if a.translator_id == params[:translator_id]
				@rate = a.rate
			end
		end

		@links = Link.where(:project_id => params[:project_id])

		@links.each do |l|
			if l.translator_id == params[:translator_id]
				@order = Order.find(l.order_id)
			end
		end

		@total = @order.value

		@manager = current_user

		ProjectMailer.project_email(@translator, @project, @rate, @total, params[:handoff], params[:request], params[:message], @manager, @order.LLID).deliver
		ProjectMailer.project_email(@manager, @project, @rate, @total, params[:handoff], params[:request], params[:message], @manager, @order.LLID).deliver

		flash[:success] = "Email sent"
		redirect_to @project

	end	

	def email

	end

	def asset
		@project = Project.find(params[:project])
		@asset = @project.assets.build(new_asset_params)
		@asset.save
		redirect_to @project
	end

	def create 

		@client = Client.find(new_project_params[:client])
		@project = @client.projects.build
		@project.source = new_project_params[:source]
		@project.target = new_project_params[:target]
		@project.count = @client.projects.count + 1
		@project.deadline = new_project_params[:deadline]
		@project.time = new_project_params[:time]
		@project.cost = new_project_params[:value]
		if @project.save
			@asset = @project.assets.build(new_asset_params)
			if new_asset_params[:file]
				@asset.save
				@breakdown = @project.breakdowns.build

				require('open-uri')
				url_data = open(@asset.file.url).read()

				doc = Nokogiri::XML(url_data)

				variant = doc.xpath("//batchTotal//analyse") 

				variant.each do |section| 
					section.elements.each do |node| 
						case node.name 
						when "perfect" 
							@breakdown.translated = node.attr("words")
						when "inContextExact" 
							@breakdown.context = node.attr("words")
						when "exact" 
							@breakdown.hundred = node.attr("words")
						when "crossFileRepeated"
							@breakdown.format = node.attr("words")
						when "repeated"
							@breakdown.repetition = node.attr("words")
						when "total" 
							@breakdown.total = node.attr("words")
						when "new" 
							@breakdown.nomatch = node.attr("words")
						when "fuzzy" 
							case node.attr("min") 
							when "50" 
								@breakdown.fifty = node.attr("words")
							when "75" 
								@breakdown.seventy_five = node.attr("words")
							when "85" 
								@breakdown.eighty_five = node.attr("words")
							when "95" 
								@breakdown.ninety_five = node.attr("words")
							end 									
						end 
					end
				end
				@breakdown.sort = 1
				@breakdown.save

				@percents = @project.breakdowns.build
				@percents.translated = 0
				@percents.context = 10
				@percents.repetition = 10
				@percents.hundred = 10
				@percents.ninety_five = 25
				@percents.eighty_five = 50
				@percents.seventy_five = 50
				@percents.fifty = 100
				@percents.nomatch = 100
				@percents.sort = 0
				@percents.save

				flash[:success] = "Project Created"
				redirect_to @project
			else 
				@breakdown = @project.breakdowns.build
				@breakdown.translated = 0
				@breakdown.context = 0
				@breakdown.hundred = 0
				@breakdown.format = 0
				@breakdown.repetition = 0
				@breakdown.total = 0
				@breakdown.nomatch = 0
				@breakdown.fifty = 0
				@breakdown.seventy_five = 0
				@breakdown.eighty_five = 0
				@breakdown.ninety_five = 0
				@breakdown.total = 0
				@breakdown.sort = 1
				@breakdown.save

				@percents = @project.breakdowns.build
				@percents.translated = 0
				@percents.context = 10
				@percents.repetition = 10
				@percents.hundred = 10
				@percents.ninety_five = 25
				@percents.eighty_five = 50
				@percents.seventy_five = 50
				@percents.fifty = 100
				@percents.nomatch = 100
				@percents.sort = 0
				@percents.save

				flash[:success] = "Project Created"
				redirect_to @project
			end	
		else
			render 'new'
		end
	end

	def not_closed
		@projects = Project.where(:closed => false).all
		render 'index'
	end 

	def closed
		@projects = Project.where(:closed => true).all
		render 'index'
	end

	def destroy
		Project.find(params[:id]).destroy
		redirect_to projects_path
	end

	def update 

	end

	def finished
		@project = Project.find(params[:id])
		@project.toggle!(:closed)
		redirect_to @project
	end

	private

		def new_project_params
			params.require(:project).permit(:client, :cost, :source, :target, :value, :deadline, :time, assets_attributes: [:file])
		end

		def new_asset_params
			params.require(:project).permit(:file)
		end

		def signed_in_user
  			redirect_to root_url, notice: "Please Sign in." unless signed_in?
  		end
end
