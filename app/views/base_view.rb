class BaseView
  def display_elements(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1} - " + element.to_s
    end
  end

  def ask_for(attribute)
    klass = self.class.to_s.chomp("sView").downcase
    puts "What's the #{attribute} of the #{klass}?"
    print "> "

    @input = gets.chomp

    @input if valid?(attribute)
  end

  private

  def valid?(attribute)
    validate_presence(attribute) && validate_number(attribute)
  end

  def validate_presence(attribute)
    while @input.empty?
      puts "'#{attribute}' must be present."
      print "> "
      @input = gets.chomp
    end

    @input
  end

  def validate_number(attribute)
    return @input unless attribute == :price

    until @input =~ /^\d+$/
      puts "'#{attribute}' must be a number."
      print "> "
      @input = gets.chomp
    end

    @input = @input.to_i
  end
end





