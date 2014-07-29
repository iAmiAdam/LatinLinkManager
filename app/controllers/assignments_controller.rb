class AssignmentsController < ApplicationController

	def create
		@project = Project.find(params[:assignment][:project])
		@assignment = @project.assignments.build
		@assignment.translator_id = params[:assignment][:translator]
		@assignment.save
		redirect_to @project
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		@project = Project.find(@assignment.project_id)
		Assignment.find(params[:id]).destroy
		redirect_to @project
	end

	private

		def assignment_params
			params.require(:assignment).permit(:project, :translator)
		end
end
