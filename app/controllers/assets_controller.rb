class AssetsController < ApplicationController

	def new
		@asset = Asset.new
	end

	def create 
		@project = Project.find(params[:asset][:project_id])
		@asset = @project.assets.build(new_asset_params)
		@asset.save
		redirect_to @project
	end


	def destroy
	end

	private

		def new_asset_params
			params.require(:asset).permit(:file, :project_id)
		end
end
