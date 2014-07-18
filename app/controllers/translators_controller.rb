class TranslatorsController < ApplicationController
	before_action :signed_in_user
	
	def index
		@translators = Translator.all
	end

	def show 
		@translator = Translator.find(params[:id])
	end

	def new 
		@translator = Translator.new
	end

	def create
		@translator = Translator.new(translator_params)
	  	if @translator.save
	  		flash[:success] = "Translator created."
	  		redirect_to alltranslator_path
	  	else
	  		render 'new'
	  	end
	end

	def edit
		@translator = Translator.find(params[:id])
	end

	def update
		@translator = Translator.find(params[:id])
	  	if @translator.update_attributes(translator_params)
	  		redirect_to alltranslator_path
	  	else
	  		render 'edit'
	  	end
  	end

  	def destroy
	  	Translator.find(params[:id])
	  	flash[:success] = "Translator deleted."
	  	redirect_to alltranslators_path
  	end

  	private

  	def translator_params 
  		params.require(:translator).permit(:name, :email, :rate)
  	end

  	def signed_in_user
  		redirect_to root_url, notice: "Please Sign in." unless signed_in?
  	end
end
