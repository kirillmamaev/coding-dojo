require_relative '../lib/order'
require_relative '../lib/printer'

RSpec.describe Printer do
  describe "#print_tax_invoice" do
    context "when the printer has paper" do
      it 'prints the tax invoice' do
        printer = Printer.new

        allow(Device).to receive(:device_has_paper?).and_return(true)

        printer.print_tax_invoice("uuid", "beer")

        expect(printer.queue).to contain_exactly('Tax invoice: uuid beer')
      end
    end

    context "when the printer is out of paper" do
      it 'raises an error' do
        printer = Printer.new

        allow(Device).to receive(:device_has_paper?).and_return(false)

        expect { printer.print_tax_invoice("uuid", "beer") }.to raise_error(described_class::OutOfPaperError)
      end
    end
  end

  describe "#print_customer_copy" do
    context "when the printer has paper" do
      it 'prints the customer copy' do
        printer = Printer.new

        allow(Device).to receive(:device_has_paper?).and_return(true)

        printer.print_customer_copy("uuid", "beer")

        expect(printer.queue).to contain_exactly('Customer copy: uuid beer')
      end
    end

    context "when the printer is out of paper" do
      it 'raises an error' do
        printer = Printer.new

        allow(Device).to receive(:device_has_paper?).and_return(false)

        expect { printer.print_customer_copy("uuid", "beer") }.to raise_error(described_class::OutOfPaperError)
      end
    end
  end

  describe '#print_refund' do
    context "when the printer has paper" do
      it 'prints the refund' do
        printer = Printer.new

        allow(Device).to receive(:device_has_paper?).and_return(true)

        printer.print_refund("uuid")

        expect(printer.queue).to contain_exactly('Refund order uuid')
      end
    end

    context "when the printer is out of paper" do
      it 'raises an error' do
        printer = Printer.new

        allow(Device).to receive(:device_has_paper?).and_return(false)

        expect { printer.print_refund('uuid') }.to raise_error(described_class::OutOfPaperError)
      end
    end
  end
end
