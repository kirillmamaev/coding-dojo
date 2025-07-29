class OrdersRepo
  attr_reader :orders
  attr_accessor :current_id

  def initialize
    @orders = []
    @current_id = 1
  end

  def add_order(order)
    @orders << order
  end

  def clear
    @orders.clear
  end
end
