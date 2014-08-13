class StaticPagesController < ApplicationController
	before_action :signed_in_user

	def home
		@projects = Project.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
		@deadlines = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month)
		@open = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month, :closed => false)
		@closed = Project.where(:deadline => Time.now.beginning_of_month..Time.now.end_of_month, :closed => true)
	end

	private

		def signed_in_user
  			redirect_to signin_url, notice: "Please Sign in." unless signed_in?
  		end
end
