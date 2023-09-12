require_relative 'DecoratorBase'

class TrimmerDecorator < DecoratorBase
  def correct_name
    super[0..9]
  end
end
