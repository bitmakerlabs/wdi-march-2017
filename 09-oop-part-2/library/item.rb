class Item

  @@num_total    = 0
  @@num_borrowed = 0

  attr_reader :title
  attr_reader :borrowed

  # READERS
  def self.num_total
    @@num_total
  end

  def self.num_borrowed
    @@num_borrowed
  end

  def initialize(title)
    @title = title
    @borrowed = false

    @@num_total += 1
  end

  def check_out
    unless @borrowed
      @borrowed = true
      @@num_borrowed += 1
    end
  end

  def check_in
    if @borrowed
      @borrowed = false
      @@num_borrowed -= 1
    end
  end

end
