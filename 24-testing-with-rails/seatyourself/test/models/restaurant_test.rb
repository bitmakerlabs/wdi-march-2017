require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test 'two restaurants exist' do
    assert_equal 2, Restaurant.all.size
  end

end
