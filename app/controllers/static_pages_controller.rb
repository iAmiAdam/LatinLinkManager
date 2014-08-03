class StaticPagesController < ApplicationController
	before_action :signed_in_user

	def home
	end

	private

		def signed_in_user
  			redirect_to signin_url, notice: "Please Sign in." unless signed_in?
  		end
end
