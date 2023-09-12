require_relative 'Nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super
    @id = Random.rand(1..2000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  private

  def of_age?
    @age >= 18
  end
end
