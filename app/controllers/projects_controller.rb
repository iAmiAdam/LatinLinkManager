class ProjectsController < ApplicationController

	def index
		@projects = Project.all 
	end

	def show 
		@project = Project.find(params[:id])
		@assets = @project.assets
	end

	def new
		@project = Project.new
	end

	def create 

		@client = Client.find(new_project_params[:client])
		@project = @client.projects.build
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

	def destroy
		Project.find(params[:id]).destroy
	end

	def update 

	end

	private

		def new_project_params
			params.require(:project).permit(:client, assets_attributes: [:file])
		end

		def new_asset_params
			params.require(:project).permit(:file)
		end
end
