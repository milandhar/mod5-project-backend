require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save a project without a title" do
    project = Project.new
    project.image_url = "www.google.com"
    assert_not project.save, "Saved the project without a title"
  end

  test "should not save a project without an image url" do
    project = Project.new
    project.title = "Save Lives"
    assert_not project.save, "Saved the project without a title"
  end
end
