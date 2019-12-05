require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "should get project count" do
      get "/api/v1/projects"
      assert_response :success
    end
end
