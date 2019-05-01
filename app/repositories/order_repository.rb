require_relative 'base_repository'

class OrderRepository < BaseRepository
  def initialize(csv_filepath, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_filepath)
  end

  def undelivered_orders
    # orders.select { |order| !order.delivered? }
    orders.reject { |order| order.delivered? }
  end

  def save
    save_csv
  end

  private

  def orders
    @elements
  end

  def build_element(row)
    # Converting 'string booleans' to 'proper' booleans
    # row[:delivered] => String : "true" or "false"
    # "true"  == "true" => true
    # "false" == "true" => false
    Order.new({
      id: row[:id],
      meal: @meal_repository.find(row[:meal_id].to_i),
      customer: @customer_repository.find(row[:customer_id].to_i),
      employee: @employee_repository.find(row[:employee_id].to_i),
      delivered: row[:delivered] == "true"
    })
  end
end
