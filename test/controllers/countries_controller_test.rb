require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest

  test "should get country count" do
      get "/api/v1/countries"
      assert_response :success
    end
end
