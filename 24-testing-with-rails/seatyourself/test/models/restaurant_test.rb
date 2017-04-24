require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  setup do
    @restaurant = FactoryGirl.create :restaurant
    @now        = Time.now
  end

  test 'two restaurants exist' do
    FactoryGirl.create :restaurant
    assert_equal 2, Restaurant.all.size
  end

  test 'small restaurant has small capacity' do
    @small = FactoryGirl.create :restaurant, capacity: 25
    assert @small.capacity <= 25
  end

  test 'restaurant is not available for a zero-sized party' do
    assert_not @restaurant.available?(0, @now)
  end

  test 'restaurant is available for a small party' do
    assert @restaurant.available?(5, @now)
  end

  test 'restaurant is available for party at capacity' do
    assert @restaurant.available?(@restaurant.capacity, @now)
  end

  test 'restaurant is not available for a huge party' do
    assert_not @restaurant.available?(101, @now)
  end

  test 'restaurant is not available when it is full' do
    FactoryGirl.create :reservation, restaurant: @restaurant, party_size: @restaurant.capacity
    assert_not @restaurant.available?(1, @now)
  end

  test 'restaurant is available when it is not full' do
    FactoryGirl.create :reservation, restaurant: @restaurant, party_size: (@restaurant.capacity - 1)
    assert @restaurant.available?(1, @now)
    FactoryGirl.create :reservation, restaurant: @restaurant, party_size: 1
    assert_not @restaurant.available?(1, @now)
  end

  test 'restaurant is available for reservations later' do
    FactoryGirl.create :reservation, restaurant: @restaurant, party_size: @restaurant.capacity, time: @now
    later = @now + 1.hour
    assert @restaurant.available?(1, later)
  end

  test 'restaurant is not available for reservations now' do
    FactoryGirl.create :reservation, restaurant: @restaurant, party_size: @restaurant.capacity, time: @now
    assert_not @restaurant.available?(1, @now)
  end

end
