require_relative '../classes/book'
require_relative '../classes/rental'
require_relative '../classes/student'

describe Book do
  context 'Create an instance and add rentals to the book' do
    it 'should create an instance of a book' do
      book = Book.new('Emmanuel', 'Grace')
      expect(book).to be_a Book
    end

    it 'Add a book to rentals' do
      book1 = Book.new('Emmanuel', 'Grace')
      person = Student.new(12, 'Cephas', 'y')
      rental_book = book1.add_rental(person, '2023-21-9')
      expect(rental_book).to be_a Rental
    end
  end
end
