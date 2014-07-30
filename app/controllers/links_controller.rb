class LinksController < ApplicationController
	def new

	end	

	def create
		if (new_link_params[:project_id])
			@project = Project.find(new_link_params[:project_id])
			@link = @project.links.build
			@link.order_id = new_link_params[:order_id]
			@link.save
			redirect_to @project
		else 
			@translator = Translator.find(new_link_params[:translator_id])
			@link = @translator.links.build
			@link.order_id = new_link_params[:order_id]
			@link.save
			@order = Order.find(new_link_params[:order_id])
			redirect_to @order
		end
	end

	def destroy

	end

	private

		def new_link_params
			params.require(:link).permit(:project_id, :order_id, :translator_id)
		end
end
