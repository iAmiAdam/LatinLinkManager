class ClientsController < ApplicationController

	def index 
		@clients = Client.all
	end

	def show
		@client = Client.find(params[:id])

	def new
		@client = Client.new
	end

	def create 
		@client = Client.new(client_params)
		if @client.save
			flash[:success] = "Client Created"
			redirect_to 
		else
			render 'new'
		end
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update 
		@client = Client.find(params[:id])
		if @client.update_attributes[client_params]
			redirect_to allclients_path
		else
			render 'edit'
		end
	end

	def destroy 
		Client.find(params[:id]).destroy
		flash[:success] = "Client deleted"
	end

	private

		def client_params
			params.require(:client).permit(:name, :contact)
		end
end