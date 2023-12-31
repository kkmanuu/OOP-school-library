require_relative '../classes/person'

describe Person do
  context 'Create an instance of person and test methods' do
    it 'Create an instance of the class person with parameters name and parent permission as default' do
      person = Person.new(22)
      expect(person).to be_a Person
    end
    it 'Test the correct name method' do
      person = Person.new(22)
      correct = person.correct_name
      expect(correct).to eq 'Unknown'
    end
    it 'Test can use services method for a minor with parent permission' do
      person = Person.new(17, 'cephas', parent_permission: true)
      use_service = person.can_use_services?
      expect(use_service).to eq true
    end
    it 'Test can use services method for an adult' do
      person = Person.new(18, 'Grace', parent_permission: false)
      use_service = person.can_use_services?
      expect(use_service).to eq true
    end
    it 'Test add rental method' do
      person = Person.new(34, 'Emmanuel Kipngeno')
      book = Book.new('The Blossom of the savanna', 'olekaello')
      rental = Rental.new('2021-11-22', book, person)
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
