require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save a project without a title" do
    project = Project.new
    project.image_url = "www.google.com"
    project.theme_str_id = "env"
    project.project_link = "https://www.globalgiving.org/projects/nourish-a-young-brain-protect-one-ancient-culture/"
    assert_not project.save, "Saved the project without a title"
  end

  test "should not save a project without an image url" do
    project = Project.new
    project.title = "Save Lives"
    project.theme_str_id = "env"
    project.project_link = "https://www.globalgiving.org/projects/nourish-a-young-brain-protect-one-ancient-culture/"
    assert_not project.save, "Saved the project without an image url"
  end

  test "should not save a project without a project link" do
    project = Project.new
    project.title = "Save Lives"
    project.theme_str_id = "env"
    project.image_url = "www.google.com"
    assert_not project.save, "Saved the project without a project link"
  end

  test "should not save a project without a theme id" do
    project = Project.new
    project.title = "Save Lives"
    project.project_link = "https://www.globalgiving.org/projects/nourish-a-young-brain-protect-one-ancient-culture/"
    project.image_url = "www.google.com"
    assert_not project.save, "Saved the project without a theme id"
  end

  test "should query the active projects API endpoint without error" do
    assert_nothing_raised do
      Project.queryActiveProjects(nextProject:nil)
    end
  end

    test "should return a json of projects that has a next project ID" do
      assert Project.queryActiveProjects(nextProject:nil)["projects"]["nextProjectId"]
    end

    test "should return a json of projects whose first project has an ID" do
      assert Project.queryActiveProjects(nextProject:nil)["projects"]["project"].first["id"]
    end

  # test "should report error" do
  #   # some_undefined_variable is not defined elsewhere in the test case
  #   some_undefined_variable
  #   assert true
  # end

end
