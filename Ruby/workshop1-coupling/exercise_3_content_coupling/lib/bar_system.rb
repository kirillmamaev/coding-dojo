require 'orders_repo'
require 'printer'
require 'order'

class BarSystem
  attr_reader :orders_repo, :printer

  def initialize(printer = Printer.new, orders_repo = OrdersRepo.new)
    @printer = printer
    @orders_repo = orders_repo
  end

  def order_drink(drink)
    order = Order.new(drink, false)
    orders_repo.add_order(order)
    order
  end

  def pay_order(order_id)
    order = find_order(order_id)
    order.set_as_paid
  end

  def print_tax_invoice(order_id)
    order = find_order(order_id)
    printer.print_tax_invoice(order.uuid, order.drink)
  end

  def print_customer_copy(order_id)
    order = find_order(order_id)
    printer.print_customer_copy(order.uuid, order.drink)
  end

  def print_refund(order_id)
    order = find_order(order_id)
    printer.print_refund(order.uuid)
  end

  private

  def find_order(order_id)
    order = orders_repo.orders.find { |o| o.uuid == order_id }
    raise ArgumentError, 'not found' if order.nil?

    order
  end
end
