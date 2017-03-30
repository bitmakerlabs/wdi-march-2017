class Person

  attr_reader :alive
  attr_writer :password, :deep_dark_secret
  attr_accessor :first_name, :last_name, :job_title

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @alive      = true
  end

  def full_name
    "#{ first_name } #{ @last_name }"
  end

  def daydream
    @deep_dark_secret = 'I want pizza'
  end

end

class Professor < Person

  attr_accessor :field_of_study

  def initialize(first_name, last_name, field_of_study)
    super(first_name, last_name)
    @field_of_study = field_of_study
  end

  def full_name
    "Professor #{ super }"
  end

  def teach(students)
    students.each { |student| student.learn }
  end

end

class Student < Person

  attr_reader :knowledge_level

  def initialize(first_name, last_name)
    super(first_name, last_name)
    @knowledge_level = 0
  end

  def learn
    @knowledge_level += 1
  end

  def slack
    @knowledge_level -= 1 if @knowledge_level > 0
  end

end
