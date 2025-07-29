require_relative '../../lib/bar_system'

UUID_REGEX = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/.freeze

RSpec.describe BarSystem do
  describe "exercise 1" do
    context "when the printer has paper" do
      it "orders are created with a uuid instead of an id" do
        printer = Printer.new
        bar_system = BarSystem.new(printer)

        allow(Device).to receive(:device_has_paper?).and_return(true)

        order = bar_system.order_drink("wine")

        expect(order).to have_attributes(uuid: match(UUID_REGEX))
      end

      it "the system uses the uuid as the identifer for orders" do
        printer = Printer.new
        bar_system = BarSystem.new(printer)

        allow(Device).to receive(:device_has_paper?).and_return(true)

        order = bar_system.order_drink("cola")
        uuid = order.uuid
        bar_system.pay_order(uuid)
        bar_system.print_tax_invoice(uuid)
        bar_system.print_customer_copy(uuid)
        bar_system.print_refund(uuid)

        expect(printer.queue).to contain_exactly(
                                   "Tax invoice: #{uuid} cola",
                                   "Customer copy: #{uuid} cola",
                                   "Refund order #{uuid}"
                                 )
      end
    end

    context "when the printer is out of paper" do
      it "raises an error when it's out of paper" do
        printer = Printer.new
        bar_system = BarSystem.new(printer)

        allow(Device).to receive(:device_has_paper?).and_return(false)

        order = bar_system.order_drink("cola")
        uuid = order.uuid
        bar_system.pay_order(uuid)

        expect { bar_system.print_tax_invoice(uuid) }.to raise_error(Printer::OutOfPaperError)
      end
    end
  end
end
