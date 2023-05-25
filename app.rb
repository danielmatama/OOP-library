require './person'
require './teacher'
require './book'
require './student'
require './classroom'
require './rental'
require 'json'
require './modules/data'

class App
  def initialize
    super
    @books = []
    @persons = []
    @rentals = []
  end
end
