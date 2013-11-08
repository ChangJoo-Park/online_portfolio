class ProjectsController < ApplicationController
	respond_to :html, :json
	def index
		if user_signed_in?
			@projects = current_user.projects.order("position")
			@project = current_user.projects.new
		else
			redirect_to new_user_session_path
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		remove = params[:chk_thumbnail]
		@project.thumbnail = nil if remove

		respond_to do |format|
			if @project.update_attributes(project_params)
				format.html { redirect_to @project, notice:'Project was successfully updated.' }
				format.json { head :ok }
			else
				format.html { render action: 'edit' }
				format.json { render json: @project.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end

	def create
    @project = Project.new(project_params)
    @user = current_user
    @project.user_id = @user.id
     respond_to do |format|
       if @project.save
         format.html { redirect_to @project }
         format.js
       else
         render 'new'
       end
     end
	end

	def destroy
		@project = Project.find(params[:id])

		respond_to do |format|
			if @project.destroy
				format.html { redirect_to projects_path }
				format.js { render layout: false }
			else
				redirect_to @project
			end
		end
	end
	def sort
		@projects = params[:project]
		@projects.each_with_index do |id, index|
			project = Project.find_by(id:id)
			project.position = index
			project.save
		end
		render nothing: true
	end

	private
		def project_params
			params.require(:project).permit(:title, :thumbnail_url, :description, :url, :work_for, :types, :layouts, :visibility, :thumbnail, :position)
		end

end
