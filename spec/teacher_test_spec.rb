require_relative '../classes/teacher'

describe Teacher do
  context 'Create an instance of the teacher and test methods' do
    it 'create an instance of the teacher' do
      teacher = Teacher.new('computer', 24, 'Emmanuel')
      expect(teacher).to be_a Teacher
    end

    it 'Testing can use method' do
      teacher = Teacher.new('computer', 34, 'Emmanuel')
      use_services = teacher.can_use_services?
      expect(use_services).to eq true
    end
  end
end
