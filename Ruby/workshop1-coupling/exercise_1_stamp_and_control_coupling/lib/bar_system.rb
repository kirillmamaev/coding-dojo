require 'orders_repo'
require 'printer'
require 'order'

class BarSystem
  attr_reader :orders_repo, :printer

  def initialize(printer = Printer.new, orders_repo = OrdersRepo)
    @printer = printer
    @orders_repo = orders_repo
  end

  def order_drink(drink)
    order = Order.new(drink, false)
    orders_repo.add_order(order)
    orders_repo.current_id = orders_repo.current_id + 1
    order
  end

  def pay_order(order_id)
    order = find_order(order_id)
    order.paid = true
  end

  def print_tax_invoice(order_id)
    order = find_order(order_id)
    printer.print_receipt(order, false)
  end

  def print_customer_copy(order_id)
    order = find_order(order_id)
    printer.print_receipt(order, true)
  end

  def print_refund(order_id)
    order = find_order(order_id)
    printer.print_refund(order)
  end

  private

  def find_order(order_id)
    order = orders_repo.orders.find { |o| o.uuid == order_id }
    raise ArgumentError, 'not found' if order.nil?

    order
  end
end
