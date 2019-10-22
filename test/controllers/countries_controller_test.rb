require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  def setup
    @controller = CountriesController.new
  end

  test "should get country count" do
      get :index
      assert_response :success
    end
end
