class LinksController < ApplicationController
	def new

	end	

	def create
		if new_link_params[:project_id]
			@project = Project.find(new_link_params[:project_id])
			@link = @project.links.build
			@link.order_id = new_link_params[:order_id]
			@link.save
			redirect_to @project
		elsif  new_link_params[:translator_id]
			@translator = Translator.find(new_link_params[:translator_id])
			@link = @translator.links.build
			@link.order_id = new_link_params[:order_id]
			@link.save
			@order = Order.find(new_link_params[:order_id])
			redirect_to @order
		else
			@client = Client.find(new_link_params[:client_id])
			@link = @client.links.build
			@link.order_id = new_link_params[:order_id]
			@link.save
			@order = Order.find(new_link_params[:order_id])
			redirect_to @order
		end
	end

	def destroy
		@link = Link.find(params[:id])
		@project = Project.find(@link.project_id)
		Link.find(params[:id]).destroy
		redirect_to @project
	end

	private

		def new_link_params
			params.require(:link).permit(:project_id, :order_id, :translator_id, :client_id)
		end
end
