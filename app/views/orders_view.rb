require_relative 'base_view'

class OrdersView < BaseView
  def ask_for_index_of(klass)
    puts "What's the #{klass} for the order?"
    print "> "

    gets.chomp.to_i - 1
  end
end





