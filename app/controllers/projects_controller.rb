class ProjectsController < ApplicationController

	def index
		@projects = Project.all 
	end

	def show 
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create 

		@client = Client.find(new_project_params[:client])
		@project = @client.projects.build
		if @project.save
			@project.assets.build(new_project_params[:file])
			flash[:success] = "Project Created"
			redirect_to @project
		else
			render 'new'
		end

	end

	def destroy
		Project.find(params[:id]).destroy
	end

	def update 

	end

	private

		def new_project_params
			params.require(:project).permit(:client, :file)
		end
end
