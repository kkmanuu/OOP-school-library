require_relative 'person'

class Teacher < person
    def initialize(name = "Unknown", age = 0, parent_permission = true )
        super(name, age)
        @specializations = specializations
    end

    def can_use_services?
        true
    end
end