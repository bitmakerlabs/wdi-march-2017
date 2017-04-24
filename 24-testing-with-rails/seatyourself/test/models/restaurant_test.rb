require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test 'two restaurants exist' do
    2.times { FactoryGirl.create :restaurant }
    assert_equal 2, Restaurant.all.size
  end

  test 'small restaurant has small capacity' do
    small = FactoryGirl.create :restaurant, capacity: 25
    assert small.capacity <= 25
  end

end
