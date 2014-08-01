class BreakdownsController < ApplicationController
	def new
	end

	def create 
	end

	def destroy
	end

	private

		def new_breakdown_params
			params.require(:breakdown).permit(:project_id, :translated, :context, :repetition, :format, :hundred, :ninety_five, :eighty_five, :seventy_five, :fifty, :new, :total)
		end	
end
