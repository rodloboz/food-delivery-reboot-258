require_relative 'base_controller'
require_relative '../views/orders_view'
require 'byebug'

class OrdersController < BaseController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display_elements(orders)
  end

  def list_my_orders(employee)
    orders = undelivered_orders(employee)
    @view.display_elements(orders)
  end

  def mark_as_delivered(employee)
    orders =  @order_repository.all
    id = @view.ask_for_index_of(:id)
    orders[id].deliver!
    @order_repository.save
  end

  def add
    # ask user for meal
    meal_index = @view.ask_for_index_of(:meal)
    meal = @meal_repository.all[meal_index]

    # ask user for customer
    customer_index = @view.ask_for_index_of(:customer)
    customer = @customer_repository.all[customer_index]

    # ask user for employee
    employee_index = @view.ask_for_index_of(:employee)
    employee = @employee_repository.all[employee_index]

    # create an Order instance
    order = Order.new({
      meal: meal,
      customer: customer,
      employee: employee
    })

    # save the Order instance
    @order_repository.add(order)
  end

  private

  def undelivered_orders(employee)
    @order_repository.undelivered_orders.select do |order|
      order.employee == employee
    end
  end
end
