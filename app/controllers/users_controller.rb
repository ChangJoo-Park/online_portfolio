class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @projects = @user.projects.order('position')
  end
end
