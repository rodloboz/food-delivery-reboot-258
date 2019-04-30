require_relative 'base_view'

class MealsView < BaseView
  def ask_for(attribute)
    puts "What's the #{attribute} of the meal?"
    print "> "

    super
  end
end





