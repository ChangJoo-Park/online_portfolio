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


	def update
		@project = Project.find(params[:project_id])
		@image = @project.sub_images.find(params[:id])
		@image.caption = params[:sub_image][:caption]
		@image.save
		render nothing: true
	end


	def sort
		logger.info "start sort"
		@project = Project.find_by(id: params[:project_id])
		@images = @project.sub_images.find(params[:sub_image])
		logger.info "test"
		params[:sub_image].each_with_index do |sub, index |
			image = @project.sub_images.find_by(id: sub)
			image.position = index
			image.save
			if image.position.equal?(0)
				@project.thumbnail_url = image.image_url
			end
		end
		render nothing: true
	end

	private
		def image_params
		params.require(:sub_image).permit(:url,:caption, :selected, :project_id, :position, :image)
	end

end
