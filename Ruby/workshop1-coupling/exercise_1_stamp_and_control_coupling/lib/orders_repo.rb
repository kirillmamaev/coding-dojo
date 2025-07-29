class OrdersRepo
  @@orders = []
  @@current_id = 1

  def self.orders
    @@orders
  end

  def self.add_order(order)
    @@orders << order
  end

  def self.current_id
    @@current_id
  end

  def self.current_id=(id)
    @@current_id = id
  end
end
