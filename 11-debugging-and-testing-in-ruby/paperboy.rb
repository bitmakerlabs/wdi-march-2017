class Paperboy

  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0
  end

  def quota
    return 50 + @experience / 2
  end

  def report
    return "I'm #{@name}, I've delivered #{@experience} papers and I've earned #{@earnings} so far!"
  end

  def deliver(start_address, end_address)
    number_of_houses = end_address - start_address + 1

    latest_payment = calculate_pay(number_of_houses)

    @earnings += latest_payment
    @experience += number_of_houses

    return latest_payment
  end

  def calculate_pay(houses)
    pay = houses * 0.25

    if houses < quota
      pay -= 2
    elsif houses > quota
      pay += 0.25 * houses - quota
    end


    return pay
  end

end

me = Paperboy.new("Natalie")
me.deliver(101,160)
puts me.report
me.deliver(1,75)
puts me.report
