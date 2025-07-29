class SalesReporter
  def initialize(orders_repo)
    @orders_repo = orders_repo
  end

  def unpaid_orders
    orders_repo.orders.select { |order| order.paid == false }
  end

  private

  attr_accessor :orders_repo
end
