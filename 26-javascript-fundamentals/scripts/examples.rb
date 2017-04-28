# Numbers
a_number = 10
a_floating_point_number = 3.1415

# Strings
a_string = 'this is a string'
another_string = "This is also a string"

# Booleans (True and False)
a_true = true
a_false = false

# undefined
# doesn't have one

# null
# this is an value that indicates something explicitly has no value
null_value = nil

# arrays
an_empty_array = []
days_of_the_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
mixed_array = [1, 2, 'THREE', 'Four', false]

days_of_the_week[1]      # => Monday
days_of_the_week.length  # => 7

# Object Literals
an_object = { key: "value", name: "description", "title": "body"}


def simple_for_loop
  for i in 0...9 do
    puts i
  end

  puts "Done looping! i = #{i}"
end

# For Loop
def for_loop
  mystring = "some random string"
  sum = 0
  for i in 0..mystring.length do
    sum += i # sum = sum + i
    puts mystring[i]
  end

  puts "sum: ", sum
end


# While Loop
def while_loop
  counter = 200
  while counter < 100 do
    counter += 1
    puts 'Counter:', counter
  end
end


# Do/While Loop
def do_while_loop
  at_least_once = false

  loop do
    puts 'at_least_once:', at_least_once
    break if at_least_once
    at_least_once = true
  end

  puts 'at_least_once after loop', at_least_once
end


def infinite_loop
  counter = 0
  loop do
    counter += 1
    puts counter

    if counter > 10
      puts "Found a match!"
      break
    end
  end

  puts "Final counter:", counter
end


# If Statement
def if_statement
  something_true = true; something_false = false
  a_string = "PROTOTYPE"
  result = nil

  if a_string.length >= 9
    puts "Condition A"
    result = a_string.length
  elsif a_string.length < 9
    puts "Condition B"
    result = "short"
  else
    puts "DEFAULT CASE"
    result = nil
  end

  puts "result: ", result
end

def ternary_operator
  ten = 10
  result = (ten >= 10) ? true : false

  puts "result:", result
end


def case_statement
  fruit = "Banana"

  case fruit
  when "Apple"
      puts "APPLE"
  when "Pear"
      puts "PEAR"
  when "Banana"
  when "Costa Rican Banana"
  when "African Banana"
  when "Plantain"
      puts "BANANA"
  else
      puts "DEFAULT"
  end

  puts "Switch DONE."
end


# Named function
def named_function
  puts "Inside named_function"
end

def sum(a, b)
  return a + b
end

# Functions with parameters
def function_with_parameters(param1, param2)
  puts 'param1:', param1
  puts 'param2:', param2
end

simple_for_loop
while_loop
do_while_loop
infinite_loop
if_statement
ternary_operator
case_statement
named_function
sum 5, 6
function_with_parameters 'first param', 'second param'


array.each do
  # do this one time for each element in the array
end

# Array#each(&block)
