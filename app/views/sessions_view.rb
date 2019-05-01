require 'io/console'

class SessionsView
  def ask_for_username
    puts "Enter username?"
    print '> '
    gets.chomp
  end

  def ask_for_password
    puts "Enter password?"
    print '> '
    STDIN.noecho(&:gets).chomp
  end

  def wrong_credentials
    puts "Wrong credentials... try again!\n"
  end

  def signed_in_successfully
    puts "You are signed in! Welcome!\n"
  end
end
