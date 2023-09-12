require_relative 'DecoratorBase'

class CapitalizeDecorator < DecoratorBase
  def correct_name
    super.capitalize
  end
end
