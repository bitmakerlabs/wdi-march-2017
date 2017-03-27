# Conditional Statements

# Pseudo-code
# if (some condition is true)
#   then run this code
# otherwise
#   run this alternative code

number = 9

if number > 10
  puts "Number greater 10"
elsif number < 10
  puts "Number is less than 10"
else
  puts "Number is equal to 10"
end

puts "Number equals 9" if number == 9

unless number == 10
  puts "Number isn't equal to 10"
end

puts "Number isn't equal to 10" unless number == 10


# Looping

cats = 0

while cats < 10
  puts "There are #{cats} cats"
  cats += 1
  # cats = cats + 1
end


# Iteration

10.times do
  puts "Ice cream is delicious!"
end

10.times do |number|
  puts "There are #{number} dogs"
end

(10..100).each do |value|
  if value % 2 == 0
    puts "#{value} is even"
  else
    puts "#{value} is odd"
  end
end
