require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
      Country.delete_all
      Country.create_all
      get "/api/v1/countries"
      assert_response :success
    end

  test "should get project count" do
      Country.delete_all
      Country.create(name: "Mexico", iso3166CountryCode: "MEX")
      project = Project.new
      project.image_url = "https://files.globalgiving.org/pfil/34796/pict_large.jpg?m=1534281939000"
      project.theme_str_id = "env"
      project.project_link = "https://www.globalgiving.org/projects/nourish-a-young-brain-protect-one-ancient-culture/"
      project.title = "Nourish a Young Brain Protect One Ancient Culture"
      project.save
      mexico = Country.find_by(iso3166CountryCode: "MEX")
      mexico.projects << project
      get "/api/v1/get_project_count"
      res = JSON.parse(@response.body)
      assert_equal 1, res[0][1]
    end

end
