require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "should get project count" do
      get :index
      assert_response :success
    end
end
