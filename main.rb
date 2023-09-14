require_relative './app'

def main
  app = App.new
  app.intro
  loop do
    app.display_options
    option = gets.chomp
    if option == '7'
      app.exit_app
    else
      app.execute_option(option)
    end
  end
end

main