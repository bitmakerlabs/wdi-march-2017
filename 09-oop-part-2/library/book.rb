require_relative 'item'

class Book < Item

  def read
    "#{ title }: It was a dark and stormy night"
  end

end
