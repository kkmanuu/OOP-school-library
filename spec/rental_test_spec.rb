require_relative '../classes/classroom'
require_relative '../classes/book'
require_relative '../classes/person'

describe Rental do
  let(:book_one) { Book.new('Rich Dad Poor Dad', 'Robert Kiyosaki') }
  let(:book_two) { Book.new('The Art of War', 'Sun Tzu') }
  let(:person_one) { Person.new(30, 'John Doe') }
  let(:person_two) { Person.new(25, 'Jane Smith') }

  context 'Tracking rentals' do
    before do
      @rental_one = Rental.new('2020-12-12', book_one, person_two)
      @rental_two = Rental.new('11/5/2119', book_one, person_one)
      @rental_three = Rental.new('2/27/2037', book_two, person_one)
    end

    it 'Create rentals' do
      expect(person_one.rentals.length).to eq 2
      expect(book_one.rentals.length).to eq 2
      expect(person_two.rentals).to include @rental_one
      expect(person_one.rentals).to include @rental_two, @rental_three
    end
  end
end
