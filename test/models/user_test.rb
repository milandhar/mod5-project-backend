require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not allow duplicate user names" do
    user1 = User.new(username: "barryobama")
    user2 = User.new(username: "barryobama")
    user1.save
    assert_not user2.save, "Saved a duplicate user name"
  end
end
