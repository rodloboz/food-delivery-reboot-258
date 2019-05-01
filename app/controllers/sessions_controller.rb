require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask for username
    username = @view.ask_for_username
    # ask for password
    password = @view.ask_for_password
    # get employee with username
    user = @employee_repository.find_by_username(username)
    # compare employee with password
    if user && user.password == password
      # if it matches log in employee
      @view.signed_in_successfully
      # returns an employee/user
      user
    else
      # else wrong credentials
      @view.wrong_credentials
      # try again
      sign_in # recursion
    end
  end
end
