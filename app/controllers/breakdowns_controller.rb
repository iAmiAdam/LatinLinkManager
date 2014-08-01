class BreakdownsController < ApplicationController
	def new
		@breakdown = Breakdown.new
	end

	def create 
		@project = Project.find(new_breakdown_params[:project_id])
		@breakdown = @project.breakdowns.build(new_breakdown_params)
		@breakdown.sort = 1
		@breakdown.save
		redirect_to @project
	end

	def update
		@breakdown = Breakdown.find(params[:id])
		@breakdown.update_attributes(new_breakdown_params)
		@project = Project.find(new_breakdown_params[:project_id])
		redirect_to @project
	end

	def destroy
		
	end

	private

		def new_breakdown_params
			params.require(:breakdown).permit(:project_id, :translated, :context, :repetition, :format, :hundred, :ninety_five, :eighty_five, :seventy_five, :fifty, :nomatch, :total)
		end	
end
