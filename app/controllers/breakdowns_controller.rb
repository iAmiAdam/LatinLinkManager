class BreakdownsController < ApplicationController
	def new
		@breakdown = Breakdown.new
	end

	def create 
		@project = Project.find(params[:project_id])
		@breakdown = @project.breakdowns.build(new_breakdown_params)
		@breakdown.sort = 1
		@breakdown.save
		redirect_to @project
	end

	def edit
		@breakdown = Breakdown.find(params[:id])
	end

	def update
		@breakdown = Breakdown.find(params[:id])
		@breakdown.update_attributes(new_breakdown_params)
		if @breakdown.sort == 1
			@total = 0
			@breakdown.attributes.each do |attr_name, attr_value| 
				if attr_name != "id" && attr_name != "project_id" && attr_name != "total" && attr_name != "created_at" && attr_name != "updated_at" && attr_name != "sort" 
					if attr_value != 0
						@total += attr_value
					end 
				end 		
			end 
			@breakdown.update_attribute(:total, @total)
		end
		@project = Project.find(@breakdown.project_id)
		redirect_to @project
	end

	def destroy
		
	end

	private

		def new_breakdown_params
			params.require(:breakdown).permit(:project_id, :translated, :context, :repetition, :format, :hundred, :ninety_five, :eighty_five, :seventy_five, :fifty, :nomatch, :total)
		end	
end
