class SubImagesController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@image = @project.sub_images.create(image_params)
		redirect_to @project
	end

	def destroy
		@project = Project.find(params[:project_id])
		@image = @project.sub_images.find(params[:id])
		respond_to do |format|
			if @image.destroy
				format.html { redirect_to @project }	
				format.js 
			else
				redirect_to @project
			end
		end

	end

	def sort
		@images = params[:sub_image]
		@images.each_with_index do |id, index|
			image = SubImage.find_by(id:id)
			image.position = index
			image.save
		end
		render nothing: true
	end	

	private
		def image_params
		params.require(:sub_image).permit(:url,:caption, :selected, :project_id, :position, :image)
	end

end
