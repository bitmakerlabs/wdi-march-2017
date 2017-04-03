require 'minitest/autorun'
require 'minitest/pride'
require_relative 'temperature.rb'

class TestTemperature < MiniTest::Test
   def test_f_to_c
     expected_value = 10
     actual_value = f_to_c(50)

     assert_equal(expected_value, actual_value)
   end

   def test_f_to_c_negative
     expected_value = -20
     actual_value = f_to_c(-4)

     assert_equal(expected_value, actual_value)
   end

   def test_f_to_c_freezing
     expected_value = 0
     actual_value = f_to_c(32)

     assert_equal(expected_value, actual_value)
   end

   def test_c_to_f
     expected_value = 50
     actual_value = c_to_f(10)

     assert_equal(expected_value, actual_value)
   end

   def test_c_to_f_negative
     expected = -4
     actual = c_to_f(-20)

     assert_equal(expected, actual)
   end

   def test_c_to_f_freezing
     expected = 32
     actual = c_to_f(0)

     assert_equal(expected, actual)
   end
end
