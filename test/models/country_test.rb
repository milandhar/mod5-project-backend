require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test "should query the countries API endpoint without error" do
    assert_nothing_raised do
      Country.queryAllCountries
    end
  end

  test "should create countries" do
    Country.delete_all
    Country.create_all
    assert_not_equal Country.all.count, 0, "Didn't create any countries"
  end

end
