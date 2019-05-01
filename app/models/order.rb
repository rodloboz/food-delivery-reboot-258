class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false

    # Instances of other models
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  def delivered?
    @delivered
  end
  alias_method :delivered, :delivered?

  def deliver!
    @delivered = true
  end

  def self.headers
    %i[id delivered meal_id employee_id customer_id]
  end

  def to_csv_row
    [id, delivered, meal.id, employee.id, customer.id]
  end

  def to_s
    "Customer: #{customer.name} | "\
    "Meal: #{meal.name} | "\
    "Delivered by: #{employee.username} | "\
    "Completed: [#{delivered? ? 'X' : ' '}]"
  end
end
