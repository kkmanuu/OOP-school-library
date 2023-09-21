require_relative '../classes/classroom'
require_relative '../classes/student'

describe Student do
    context 'Testing the functionality of class Student' do
        it'should create an instance of Students' do
            student = Student.new(45,'samuel',true)
            expect(student).to be_a Student
        end

        it 'Set the classroom' do
            student = Student.new(25, 'manuu',true)
            my_classroom =Classroom.new('Project management')
            student.classroom = student.classroom = (my_classroom)
            expect(my_classroom).to be_a Classroom
            expect(student.classroom.label).to eq 'Project management'
        end

        it 'Should return an emoji ' do
            student = Student.new(25, 'kkmanuu', true)
            expect(student.play_hooky).to eq  '¯\(ツ)/¯'
        end
    end
end