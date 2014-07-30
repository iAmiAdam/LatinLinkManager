class LinksController < ApplicationController
	def new

	end	

	def create
		@project = Project.find(new_link_params[:project_id])
		@link = @project.links.build
		@link.order_id = new_link_params[:order_id]
		@link.save
		redirect_to @project
	end

	def destroy

	end

	private

		def new_link_params
			params.require(:link).permit(:project_id, :order_id, :translator_id)
		end
end
