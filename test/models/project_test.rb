require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save a project without a title" do
    project = Project.new
    assert_not project.save, "Saved the project without a title"
  end
end