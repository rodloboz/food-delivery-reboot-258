require 'byebug'
require 'csv'

require_relative 'router'

require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/models/customer'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/models/employee'
require_relative 'app/repositories/employee_repository'

require_relative 'app/models/session'
require_relative 'app/controllers/sessions_controller'

meals_csv_filepath = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(meals_csv_filepath)
meals_controller = MealsController.new(meal_repository)

customers_csv_filepath = File.join(__dir__, 'data/customers.csv')
customer_repository = CustomerRepository.new(customers_csv_filepath)
customers_controller = CustomersController.new(customer_repository)

employees_csv_filepath = File.join(__dir__, 'data/employees.csv')
employee_repository = EmployeeRepository.new(employees_csv_filepath)

sessions_controller = SessionsController.new(employee_repository)

controllers = {
  meals_controller: meals_controller,
  customers_controller: customers_controller,
  sessions_controller: sessions_controller
}

router = Router.new(controllers)

router.run
