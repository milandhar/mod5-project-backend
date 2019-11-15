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
      assert_response(:success, message = "failed to create user")
    end

  test "should remove saved project" do
    user = User.create(user_params[:user])
    user.projects << project
    post "/api/v1/remove_project", params: {user_id: user.id, project_id: project.id}.to_json, headers: { "Content-Type": "application/json" }
    assert_response(:success, message = "failed to remove project")
  end

  test "should get all user's saved projects" do
      user = User.create(user_params[:user])
      user.projects << project
      starred_project_params = {user_id: user.id, project_id: project.id}
      post "/api/v1/get_user_projects", params: starred_project_params.to_json, headers: { "Content-Type": "application/json" }
      assert_response(:success, message = "failed to get all projects")
    end


    test "should verify that a project is starred" do
       User.delete_all
       user = User.new(user_params[:user])
       user.projects << project
       user.save
       post "/api/v1/check_star", params: {user_id: user.id, project_id: project.id}.to_json, headers: { "Content-Type": "application/json" }
       status_hash = JSON.parse(@response.body)
       assert_equal 'Project is starred.', status_hash["status"]
     end

   test "should verify that a project is not starred" do
      user = User.create(user_params[:user])
      #didn't add the project to this user
      post "/api/v1/check_star", params: {user_id: user.id, project_id: project.id}.to_json, headers: { "Content-Type": "application/json" }
      # message = JSON.parse(@response.message)
      status_hash = JSON.parse(@response.body)
      assert_equal 'Project is not starred.', status_hash["status"]
   end

   test "should update user" do
      user = User.create(user_params[:user])
      put "/api/v1/users/#{user.id}", params: {id: user.id, first_name: "Dylan"}.to_json, headers: { "Content-Type": "application/json" }
      res = JSON.parse(@response.body)
      assert_equal 'Dylan', res["first_name"]
   end

end
