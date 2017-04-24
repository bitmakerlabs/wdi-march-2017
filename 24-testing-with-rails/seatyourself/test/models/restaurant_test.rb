require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test 'two restaurants exist' do
    assert_equal 2, Restaurant.all.size
  end

  test 'small restaurant has small capacity' do
    assert restaurants(:small_restaurant).capacity <= 25
  end

end
