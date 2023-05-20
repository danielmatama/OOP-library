require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
