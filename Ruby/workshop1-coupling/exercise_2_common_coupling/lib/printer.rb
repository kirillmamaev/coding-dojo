class Printer
  attr_reader :queue

  class OutOfPaperError < StandardError; end

  def initialize
    @queue = []
  end

  def print_tax_invoice(order_uuid, drink)
    check_printer_paper!
    queue << "Tax invoice: #{order_uuid} #{drink}"
  end

  def print_customer_copy(order_uuid, drink)
    check_printer_paper!
    queue << "Customer copy: #{order_uuid} #{drink}"
  end

  def print_refund(order_uuid)
    check_printer_paper!
    queue << "Refund order #{order_uuid}"
  end

  private

  def check_printer_paper!
    raise OutOfPaperError unless Device.device_has_paper?
  end

end

class Device
  class NotMockedError < StandardError; end

  def self.device_has_paper?
    raise NotMockedError
  end
end
