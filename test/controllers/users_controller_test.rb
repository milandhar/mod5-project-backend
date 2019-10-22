require 'test_helper'
require 'json'


class UsersControllerTest < ActionDispatch::IntegrationTest
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

  project = Project.new
  project.image_url = "https://files.globalgiving.org/pfil/34796/pict_large.jpg?m=1534281939000"
  project.theme_str_id = "env"
  project.project_link = "https://www.globalgiving.org/projects/nourish-a-young-brain-protect-one-ancient-culture/"
  project.title = "Nourish a Young Brain Protect One Ancient Culture"
  project.save

  test "should get index" do
      get "/api/v1/users"
      assert_response :success
    end

  test "should create new user" do
      post "/api/v1/users", params: user_params.to_json, headers: { "Content-Type": "application/json" }
      assert_response(201, message = "failed to create user")
    end

  test "should remove saved project" do
    user = User.create(user_params[:user])
    user.projects << project
    post "/api/v1/remove_project", params: {user_id: user.id, project_id: project.id}.to_json, headers: { "Content-Type": "application/json" }
    assert_response(202, message = "failed to remove project")
  end

  test "should get all user's saved projects" do
      user = User.create(user_params[:user])
      user.projects << project
      starred_project_params = {user_id: user.id, project_id: project.id}
      post "/api/v1/get_user_projects", params: starred_project_params.to_json, headers: { "Content-Type": "application/json" }
      assert_response(200, message = "failed to get all projects")
    end
end
