require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  setup do
    @big   = FactoryGirl.create :restaurant, capacity: 100
    @small = FactoryGirl.create :restaurant, capacity: 25
  end

  test 'two restaurants exist' do
    assert_equal 2, Restaurant.all.size
  end

  test 'small restaurant has small capacity' do
    assert @small.capacity <= 25
  end
  
end
