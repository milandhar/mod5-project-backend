require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  user_params = { user:{
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

  test "should authorize user on login" do
    user = User.create(user_params[:user])
    post "/api/v1/login", params: user_params.to_json, headers: { "Content-Type": "application/json" }
    p @response
  end
end
