require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_the_truth
    assert true, "Test Project model with projects.yml"
  end

  test "should not save project without title" do
    project = Project.new
    assert !project.save, "Saved the project without a title"
  end
end
