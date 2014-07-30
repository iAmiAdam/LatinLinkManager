class OrdersController < ApplicationController
	before_action :signed_in_user

	def index
		@orders ||= Order.all
	end

	def show 
		@order = Order.find(params[:id])
		@clients = Client.all
		@links = Link.where(:order_id => params[:id]).all
		@link = Link.new
	end

	def open
		@orders = Order.where(:paid => false).all
		render 'index'
	end

	def closed
		@orders = Order.where(:paid => true).all
		render 'index'
	end

	def new
		@order = Order.new
		@biggest = Order.maximum(:id) + 1
		@order.LLID = "LL-#{@biggest}"
	end

	def create
		@order = Order.new(order_params)
		if @order.save
			flash[:success] = "Order created."
			redirect_to orders_path
		else
			render 'new'
		end
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update_attributes(order_params)
			redirect_to orders_path
		else
			render 'edit'
		end
	end

	def paid
		@order = Order.find(params[:id])
		@order.toggle!(:paid)
		redirect_to orders_path
	end

	def update_projects
		@projects = Project.where("client_id = ?", params[:client_id])

		respond_to do |format|
			format.js
		end
	end

	
	def destroy
		Order.find(params[:id]).destroy
		flash[:success] = "Order Deleted."
		redirect_to orders_path
	end

	private

		def order_params
			params.require(:order).permit(:LLID, :value, :category, :client, :paid)
		end

		def signed_in_user
			redirect_to root_url, notice: "Please Sign in." unless signed_in?
		end
end
