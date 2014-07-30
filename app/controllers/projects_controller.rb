class ProjectsController < ApplicationController

	def index
		@projects = Project.all 
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


		@links = @project.links
		@links.each do |l|
			@orders = @orders.to_a.push Order.find(l.order_id)
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
		@project.cost = new_project_params[:value]
		if @project.save
			@asset = @project.assets.build(new_asset_params)
			if @asset.save
				flash[:success] = "Project Created"
				redirect_to @project
			else 
				render 'new'
			end
		else
			render 'new'
		end
	end

	def open
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
			params.require(:project).permit(:client, :cost, :source, :target, :value, assets_attributes: [:file])
		end

		def new_asset_params
			params.require(:project).permit(:file)
		end
end
