require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  test "should show project" do
    @project = Project.first
    get :show, id: @project.id
    assert_response :success
  end

  test "shoulud create project" do
    
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      @project = Project.first
      delete :destroy, id: @project.id
    end

    assert_redirected_to projects_path
  end

  test "should route to project" do
    assert_routing '/projects/1',{controller: "projects", action:"show",id:"1"}
  end

end
