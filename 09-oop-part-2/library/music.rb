require_relative 'item'

class Music < Item

  def listen
    # Sorry, this only works on Mac
    `afplay thriller_sample.mov`
  end

end
