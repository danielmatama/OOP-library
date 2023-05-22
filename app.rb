require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'person'
require_relative 'book'
require_relative 'student'

class App
  def initialize
    super
    @books = []
    @persons = []
    @rentals = []
  end
end
