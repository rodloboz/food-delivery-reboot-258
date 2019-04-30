class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def self.headers
    # [:id, :name, :price]
    # %w => ["id", "name", "price"]
    %i[id name price]
  end

  def to_csv_row
    [id, name, price]
  end

  def to_s
    "Name: #{name} | Price: $#{price}"
  end
end
