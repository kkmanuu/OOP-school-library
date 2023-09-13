class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Establish the "belongs-to" association by adding the rental to the book
    book.rentals << self

    # Establish the "belongs-to" association by adding the rental to the person
    person.rentals << self
  end
end
