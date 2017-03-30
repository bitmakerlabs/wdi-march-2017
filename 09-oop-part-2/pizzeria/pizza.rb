class Pizza

  attr_reader :slices

  def initialize(toppings)
    @toppings = toppings
    @cooked = false
    @cuts_remaining = 0
    @slices = 0
  end

  def bake
    @cooked = true
    @slices = 1
    @cuts_remaining = 3
    return @cooked
  end

  def cut
    unless @cooked
      puts "ERROR: Can't cut a raw pizza"
      return
    end

    # Do the cutting
    if @cuts_remaining == 3
      @slices += 1
      @cuts_remaining -= 1
    elsif @cuts_remaining == 2 || @cuts_remaining == 1
      @slices += 2
      @cuts_remaining -= 1
    elsif @cuts_remaining == 0
      puts 'ERROR: Pizza is already too sliced!'
    end

    return @slices
  end

  def eat
    unless @cooked
      puts "ERROR: Can't eat a raw pizza"
      return
    end

    if @slices > 0
      @slices -= 1
      puts 'Nom!'
    else
      puts "ERROR: No more pizza left :("
    end

    return @slices
  end

end

class Pizzeria

  def initialize
    @open     = false
    @supplies = 0
  end

  def order(toppings)
    if @open && @supplies > 0
      @supplies -= 1
      p = Pizza.new(toppings)
      p.bake
      3.times { p.cut }
      return p
    else
      puts "ERROR: Can't make a pizza"
    end
  end

  def open
    @open = true
  end

  def close
    @open = false
  end

  def restock
    @supplies = 5 unless @open
  end

end
