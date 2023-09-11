require './person'

class Student < Person
  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  attr_reader :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end
end
