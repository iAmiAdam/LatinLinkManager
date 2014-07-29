class NotesController < ApplicationController

	def new
		@note = Note.new
	end

	def create
		@project = Project.find(note_params[:project_id])
		@note = @project.notes.build(note_params[:content])
		@note.save
		redirect_to @project
	end

	def destroy
		@note = Note.find(params[:id])
		@project = Project.find(@note.project_id) 
		@note.destroy
		redirect_to @project
	end

	private

		def note_params
			params.require(:note).permit(:project_id, :content)
		end
end
