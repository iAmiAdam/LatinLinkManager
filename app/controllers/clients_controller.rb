class ClientsController < ApplicationController
	before_action :signed_in_user

	def index 
		@clients = Client.paginate(:per_page => 10, page: params[:page])
	end

	def show
		@client = Client.find(params[:id])
		@projects = @client.projects
		@links = @client.links
		@links.each do |l|
			@orders = @orders.to_a.push Order.find(l.order_id)
		end
	end

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

	def invoice

		@client = Client.find(params[:id])
		time = Time.new(Time.now.year, params[:month])
		@projects = @client.projects.where(:created_at => time.beginning_of_month..time.end_of_month)

		@projects.each do |p|
			@links = p.links
			@links.each do |l|
				order = Order.find(l.order_id)
				if order.category == 0
					@orders = @orders.to_a.push order
				end
			end
		end

		format.pdf do
      		render pdf: @client.name,               
	            layout: 'layouts/invoice.html.erb',  
	            show_as_html: params[:debug].present?    
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
		redirect_to clients_path
	end

	private

		def client_params
			params.require(:client).permit(:name, :contact)
		end

		def signed_in_user
  			redirect_to root_url, notice: "Please Sign in." unless signed_in?
  		end
end