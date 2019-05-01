class Router
  def initialize(controllers = {})
    @meals_controller = controllers[:meals_controller]
    @customers_controller = controllers[:customers_controller]
    @sessions_controller = controllers[:sessions_controller]
    @session = Session.new
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Bistro!"
    puts "           --           "

    while @running
      # ask user to log in
      # ... => SessionsController
      resource = @sessions_controller.sign_in
      @session.sign_in(resource)
      # while @user is logged in
      while current_user
        display_tasks
        action = gets.chomp.to_i
        print `clear`
        route_action(action)
      end
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then stop
    when 0 then destroy_session
    else
      puts "Please press 1, 2, 3, 4, 9 or 0"
    end
  end

  def stop
    puts "Quitting..."
    destroy_session
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Stop and exit the program"
    puts "0 - Log out"
  end

  private

  def destroy_session
    @session.sign_out
    puts "You were logged in for #{@session.session_time}"
  end

  def current_user
    @session.resource
  end
end



