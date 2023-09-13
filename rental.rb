class Rental
  attr_accessor :date, :age, :person

  def initialize(date, age, person)
    @date = date
    @age = age
    @person = person
  end
end
