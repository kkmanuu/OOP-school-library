require_relative '../classes/person'
require_relative '../classes/capitalize_decorator'

describe CapitalizeDecorator do
  before do
    @person = Person.new(29, 'Grace kipsang')
    @capitalize_person = CapitalizeDecorator.new(@person).correct_name
  end

  context 'Create an instance of capitalize and test functionality' do
    it 'should capitalize the first name' do
      expect(@capitalize_person).to eq 'Grace kipsang'
    end
  end
end
