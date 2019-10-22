require 'test_helper'
require 'json'


class UsersControllerTest < ActionDispatch::IntegrationTest
  user_params = { user: {
    username: "milan123",
    password: "abc123",
    first_name: "Milan",
    last_name: "Dhar",
    default_country: "USA",
    theme1: 14,
    theme2: 15,
    theme3: 16
    }
  }

  test "should get index" do
      get "/api/v1/users"
      assert_response :success
    end

  test "should create new user" do
      post "/api/v1/users", params: user_params.to_json, headers: { "Content-Type": "application/json" }

      assert_response(201, message = "failed to create user")
    end
end
