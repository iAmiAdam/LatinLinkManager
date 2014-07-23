class ProjectsController < ApplicationController

	def index
		@projects = Project.all 
	end

	def show 
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
		@translators = Translator.all
	end

	def create 

	end

	def destroy
		Project.find(params[:id]).destroy
	end

	def update 

	end

	private

		def project_params

		end
end
