class AssignmentsController < ApplicationController

	def create
		@project = Project.find(params[:assignment][:project])
		@assignment = @project.assignments.build
		@assignment.translator_id = params[:assignment][:translator]
		@assignment.save
		redirect_to @project
	end

	def destroy

	end

	private

		def assignment_params
			params.require(:assignment).permit(:project, :translator)
		end
end
