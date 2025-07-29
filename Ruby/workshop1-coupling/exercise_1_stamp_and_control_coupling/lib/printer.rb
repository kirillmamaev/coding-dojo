class Printer
  attr_reader :queue

  class OutOfPaperError < StandardError; end

  def initialize
    @queue = []
  end

  def print_receipt(order, customer_copy)
    raise Printer::OutOfPaperError unless Device.device_has_paper?
    customer_copy ? print_customer_copy(order) : print_tax_invoice(order)
  end

  def print_refund(order)
    # uuid is used as an example in the real life implementation the whole order object will be used.
    queue << "Refund order #{order.uuid}"
  end

  private

  def print_tax_invoice(order)
    # In the real life implementation the whole order object will be used.
    queue << "Tax invoice: #{order.uuid} #{order.drink}"
  end

  def print_customer_copy(order)
    # In the real life implementation the whole order object will be used.
    queue << "Customer copy: #{order.uuid} #{order.drink}"
  end
end

class Device
  class NotMockedError < StandardError; end

  def self.device_has_paper?
    # Checks for paper in device.
    # Mocks that there is no paper in the Device.
    raise NotMockedError
  end
end
