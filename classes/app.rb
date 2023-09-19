require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def ask_input(input)
    puts input
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
  def create_student(name, age)
    print 'Has parent permission? [Y/N]: '
    permission = gets.downcase == 'y'
    @people << Student.new(age, name, permission)
    puts 'Person created successfully'
  end

  # Create a teacher
  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  end

  # option 3 - Create a person
  def create_person
    option = gets.chomp
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Age: '
    age = gets.to_i
    if option == '1'
      create_student(name, age)
    elsif option == '2'
      create_teacher(name, age)
    else
      puts "You entered a wrong input, it's either 1 (for a new student) or 2 (for a new teacher)"
    end
  end

  # option 4 - Create a book
  def create_book
    puts '------- Creating a book ----------'
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # Handle selecting a book
  def select_book
    puts 'Select a book from the following list by number (not by id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  end

  # Handle selecting a person
  def select_person
    puts 'Select a person from the following list by number (not by id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # option 5 - Create a rental
  def create_rental
    if @books.empty? || @people.empty?
      puts 'There are no books or people to create a rental'
      return
    end

    select_person
    person_id = gets.chomp.to_i
    select_book
    book_id = gets.chomp.to_i

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
    puts '============================='
    puts 'Thank you for using this app!'
    puts '============================='
    exit
  end
end
