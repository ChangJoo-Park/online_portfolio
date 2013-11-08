class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @projects = @user.projects.order('position')
  end

  def update_layout
    @user = current_user
    puts current_user
    puts params[:layouts]
    @user.layouts = params[:layouts]
    @user.save

    render nothing: true
  end
end
