require_relative '../lib/order'
require_relative '../lib/printer'

RSpec.describe Printer do
  describe '#print_receipt' do
    context 'when printing a tax invoice' do
      it 'prints the tax invoice' do
        printer = Printer.new
        order = Order.new('beer', true)

        allow(Device).to receive(:device_has_paper?).and_return(true)
        printer.print_receipt(order, false)

        expect(printer.queue).to contain_exactly("Tax invoice: #{order.uuid} beer")
      end
    end

    context 'when printing a customer copy' do
      it 'prints the customer copy' do
        printer = Printer.new
        order = Order.new('beer', true)

        allow(Device).to receive(:device_has_paper?).and_return(true)
        printer.print_receipt(order, true)

        expect(printer.queue).to contain_exactly("Customer copy: #{order.uuid} beer")
      end
    end
  end

  describe '#print_refund' do
    it 'prints the refund' do
      printer = Printer.new
      order = Order.new('beer', true)

      printer.print_refund(order)

      expect(printer.queue).to contain_exactly("Refund order #{order.uuid}")
    end
  end
end
