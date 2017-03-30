require_relative 'book'
require_relative 'music'

def library_report(day)
  puts "***** Library Report for Day #{ day }"
  puts "The library has #{ Item.num_total } items in total."
  puts "The library has #{ Item.num_borrowed } items borrowed."
end

day = 0
hp1 = Book.new('Harry Potter 1')
lotr1 = Book.new('Lord of the Rings 1')
thriller = Music.new('Thriller')
library_report(day)

day += 1
hp1.check_out
library_report(day)
puts hp1.read

day += 1
hp1.check_in
thriller.check_out
thriller.listen
library_report(day)

day += 1
lotr1.check_out
library_report(day)
puts hp1.read
