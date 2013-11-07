class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @projects = @user.projects.order('position')
  end

  def update
    @user = current_user
    puts current_user
    puts params[:layouts]
    @user.layouts = params[:layouts]
    @user.save
  end
end
