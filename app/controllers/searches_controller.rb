class SearchesController < ApplicationController
  def index
  end

  def new
  	@search = Search.new
  end

  def create
  	@search = Search.new(search_params)
  	@search.save
  	redirect_to @search
  end

  def show
  	@search = Search.new
  end

  private 

    def search_params 
	  	params.require(:search).permit(:name, :rate)
	end
end
