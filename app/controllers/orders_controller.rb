class OrdersController < ApplicationController
	before_action :signed_in_user

	def index
		@orders ||= Order.all
	end

	def show 
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
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

	def destroy
		Order.find(params[:id]).destroy
		flash[:success] = "Order Deleted."
		redirect_to orders_path
	end

	private

		def order_params
			params.require(:order).permit(:LLID, :value, :type, :paid)
		end

		def signed_in_user
			redirect_to root_url, notice: "Please Sign in." unless signed_in?
		end
end
