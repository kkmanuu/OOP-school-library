require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  context 'Creating a classroom' do
    it 'should create an instance of a Classroom' do
      classroom = Classroom.new('Hackers')
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'should have a label' do
      classroom = Classroom.new('Hackers')
      expect(classroom.label).to eq('Hackers')
    end

    it 'should initially have no students' do
      classroom = Classroom.new('Hackers')
      expect(classroom.students).to be_empty
    end

    it 'should add a student to the classroom' do
      classroom = Classroom.new('Hackers')
      student = Student.new(1, 'kipsang', true) # Create a sample student

      classroom.students = student

      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
