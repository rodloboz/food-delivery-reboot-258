require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  undef_method :add

  def all_delivery_guys
    employees.select { |employee| employee.delivery_guy? }
  end

  def find_by_username(username)
    employees.find { |employee| employee.username == username }
  end

  private

  def employees
    @elements
  end

  def build_element(row)
    Employee.new(row)
  end
end
