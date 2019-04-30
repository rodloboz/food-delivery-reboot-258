require_relative 'base_view'

class CustomersView < BaseView
  def ask_for(attribute)
    puts "What's the #{attribute} of the customer?"
    print "> "

    super
  end
end





