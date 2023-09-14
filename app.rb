require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def intro
    puts 'Welcome to School Library App!'
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

  # option 1 - List all books
  def list_books
    puts 'No book yet!' if @books.empty?
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  # option 2 - List all people
  def list_people
    puts 'We do not have people yet' if @people.empty?
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  # Create a student
  def create_student
    print 'Age: '
    age = gets.to_i
    print "\nName: "
    name = gets.chomp.capitalize
    print "\nHas parent permission? [Y/N]: "
    permission = gets.downcase == 'y'
    @people << Student.new(age, name, permission)
    puts 'Person created successfully'
  end

  # Create a teacher
  def create_teacher
    print 'Age: '
    age = gets.to_i
    print "\nName: "
    name = gets.chomp.capitalize
    print "\nSpecialization: "
    specialization = gets.chomp.capitalize
    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  end

  # option 3 - Create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    if option == '1'
      create_student
    elsif option == '2'
      create_teacher
    else
      puts "You entered a wrong input, it's either 1 (for a new student) or 2 (for a new teacher)"
    end
  end

  # option 4 - Create a book
  def create_book
    print "\nTitle: "
    title = gets.chomp.capitalize
    print "\nAuthor: "
    author = gets.chomp.capitalize
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # option 5 - Create a rental
  def create_rental
    if @books.empty? || @people.empty?
      puts 'There are no books or people to create a rental'
      return
    end
    puts 'Select a book from the following list by number (not by id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not by id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_id], @people[person_id])
    puts 'Rental created successfully'
  end

  # option 6 - List all rentals for a given person id
  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  # option 7 - Exit
  def exit_app
    puts 'Thank you for using this app!'
    exit
  end

  def execute_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    else
      puts 'You entered a wrong input, please try again'
    end
  end
end
