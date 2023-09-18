require './classes/app'

def intro
  puts '=============================='
  puts 'Welcome to School Library App!'
  puts '=============================='
end

def display_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def execute_option(option, app)
  case option
  when '1' then app.list_books
  when '2' then app.list_people
  when '3'
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    app.create_person
  when '4' then app.create_book
  when '5' then app.create_rental
  when '6' then app.list_all_rentals
  when '7' then app.exit_app
  else
    puts 'You entered a wrong input, please try again'
  end
end

# def main
#   app = App.new
#   intro
#   loop do
#     display_options
#     option = gets.chomp
#     execute_option(option, app)
#   end
# end

main
