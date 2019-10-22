require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
      get "/api/v1/countries"
      assert_response :success
    end

  test "should get project count" do
      get "/api/v1/get_project_count"
      assert_response :success
    end

end
