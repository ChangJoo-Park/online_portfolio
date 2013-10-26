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
	def update
		@project = Project.find(params[:id])
		@image = @project.sub_images.find(params[:id])
		respond_to do |format|
			if @image.update_attributes(project_params)
				format.html { redirect_to @image, notice:'Sub Image was successfully updated.' }
				format.json { head :ok }
			else
				format.html { render action: 'edit' }
				format.json { render json: @project.errors.full_messages, status: :unprocessable_entity }
			end
		end

	end
	end

	def sort
		puts "aatest"
		@project = Project.find_by(id: params[:project_id])
		@images = @project.sub_images.find(params[:sub_image])

		params[:sub_image].each_with_index do |sub, index |
			image = @project.sub_images.find_by(id: sub)
			image.position = index
			image.save

			puts "image's id : #{image.id}, image's position : #{image.position}"
		end
		render nothing: true
	end

	private
		def image_params
		params.require(:sub_image).permit(:url,:caption, :selected, :project_id, :position, :image)
	end

end
