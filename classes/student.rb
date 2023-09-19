require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, _parent_permission, classroom = ' ')
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.include?(self) ? classroom.students : classroom.students.append(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
