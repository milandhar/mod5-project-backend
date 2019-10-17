require 'test_helper'

class UserStarredProjectTest < ActiveSupport::TestCase
  test "should prevent a user from starring multiple projects" do
    user1 = User.create(username: "barryobama10", password: "bo")
    project1 = Project.new
    project1.title = "Nourish a young brain, protect one ancient culture"
    project1.theme_str_id = "env"
    project1.image_url = "www.google.com/img"
    project1.project_link = "https://www.globalgiving.org/projects/nourish-a-young-brain-protect-one-ancient-culture/"
    project1.save
    user_star_1 = UserStarredProject.create(project_id: project1.id, user_id: user1.id)
    user_star_2 = UserStarredProject.new(project_id: project1.id, user_id: user1.id)
    assert_not user_star_2.save, "User starred a duplicate project"
  end
end
