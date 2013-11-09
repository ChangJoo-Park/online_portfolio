class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @projects = @user.projects.order('position')
  end

  def update
    @user = current_user
    @user.update_attributes!(user_params)
  end

  def update_layout
    @user = current_user
    puts current_user
    puts params[:layouts]
    @user.layouts = params[:layouts]
    @user.save

    render nothing: true
  end

  private
    def user_params
      params.require(:user).permit(:fullname, :username, :location, :website, :facebook, :twitter, :bio, :current_password)
    end
end
