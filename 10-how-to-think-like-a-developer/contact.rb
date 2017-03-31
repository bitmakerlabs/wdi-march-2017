class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@next_id = 1000

  def initialize(first_name, last_name, email, note = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id

    @@next_id += 1
  end

  def self.create(first_name, last_name, email, note = 'N/A')
    new_contact = new(first_name, last_name, email, note)

    @@contacts << new_contact

    new_contact
  end

  def self.all
    @@contacts
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # Done via attr_accessor
  # def first_name
  #   @first_name
  # end
  #
  # def first_name=(new_name)
  #   @first_name = new_name
  # end
end
