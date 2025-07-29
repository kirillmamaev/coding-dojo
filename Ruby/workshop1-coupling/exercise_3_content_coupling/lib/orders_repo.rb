class OrdersRepo

  attr_reader :orders

  def initialize()
    @orders = []
  end

  def add_order(order)
    @orders << order
  end
end
