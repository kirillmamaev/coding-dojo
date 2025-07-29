require_relative '../lib/bar_system'

RSpec.describe BarSystem do
  describe '#order_drink' do
    it 'create the order' do
      printer = instance_double(Printer)
      bar_system = BarSystem.new(printer, OrdersRepo)
      order = instance_double(Order)

      allow(Order).to receive(:new).and_return(order)
      allow(OrdersRepo).to receive(:add_order)
      allow(OrdersRepo).to receive(:current_id).and_return(1)
      allow(OrdersRepo).to receive(:current_id=)

      bar_system.order_drink('beer')

      expect(Order).to have_received(:new).with('beer', false)
    end

    it 'adds the order to the OrdersRepo' do
      printer = instance_double(Printer)
      bar_system = BarSystem.new(printer, OrdersRepo)
      order = instance_double(Order)

      allow(Order).to receive(:new).and_return(order)
      allow(OrdersRepo).to receive(:add_order)
      allow(OrdersRepo).to receive(:current_id).and_return(1)
      allow(OrdersRepo).to receive(:current_id=)

      bar_system.order_drink('beer')

      expect(OrdersRepo).to have_received(:add_order).with(order)
    end

    it 'increments the OrdersRepo current id' do
      printer = instance_double(Printer)
      bar_system = BarSystem.new(printer, OrdersRepo)
      order = instance_double(Order)

      allow(Order).to receive(:new).and_return(order)
      allow(OrdersRepo).to receive(:add_order)
      allow(OrdersRepo).to receive(:current_id).and_return(1)
      allow(OrdersRepo).to receive(:current_id=)

      bar_system.order_drink('beer')
      expect(OrdersRepo).to have_received(:current_id=).with(2)
    end
  end

  describe '#pay_order' do
    context 'when the order exists' do
      it "sets the order's paid to true" do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)
        order = instance_double(Order, uuid: 1)

        allow(OrdersRepo).to receive(:orders).and_return([order, instance_double(Order, uuid: 2)])
        allow(order).to receive(:paid=)

        bar_system.pay_order(1)
        expect(order).to have_received(:paid=).with(true)
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error' do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)

        expect { bar_system.pay_order(777_777) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#print_tax_invoice' do
    context 'when the order exists' do
      it 'tells the printer to print the tax invoice' do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)
        order = instance_double(Order, uuid: 1)

        allow(OrdersRepo).to receive(:orders).and_return([order, instance_double(Order, uuid: 2)])
        allow(printer).to receive(:print_receipt)

        bar_system.print_tax_invoice(1)

        expect(printer).to have_received(:print_receipt).with(order, false)
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error', :aggregate_failure do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)

        allow(printer).to receive(:print_receipt)

        expect { bar_system.print_tax_invoice(777_777) }.to raise_error(ArgumentError)
        expect(printer).not_to have_received(:print_receipt)
      end
    end
  end

  describe '#print_customer_copy' do
    context 'when the order exists' do
      it 'tells the printer to print the customer copy' do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)
        order = instance_double(Order, uuid: 1)

        allow(OrdersRepo).to receive(:orders).and_return([order, instance_double(Order, uuid: 2)])
        allow(printer).to receive(:print_receipt)

        bar_system.print_customer_copy(1)

        expect(printer).to have_received(:print_receipt).with(order, true)
      end
    end

    context "when the order doesn't exist" do
      specify 'raises an error', :aggregate_failure do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)

        allow(printer).to receive(:print_receipt)

        expect { bar_system.print_customer_copy(777_777) }.to raise_error(ArgumentError)

        expect(printer).not_to have_received(:print_receipt)
      end
    end
  end

  describe 'print_refund' do
    context 'when the order exists' do
      it 'tells the printer to print the refund' do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)
        order = instance_double(Order, uuid: 1)

        allow(OrdersRepo).to receive(:orders).and_return([order, instance_double(Order, uuid: 2)])
        allow(printer).to receive(:print_refund)

        bar_system.print_refund(1)

        expect(printer).to have_received(:print_refund).with(order)
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error', :aggregate_failure do
        printer = instance_double(Printer)
        bar_system = BarSystem.new(printer, OrdersRepo)

        allow(printer).to receive(:print_refund)

        expect { bar_system.print_refund(777_777) }.to raise_error(ArgumentError)
        expect(printer).not_to have_received(:print_refund)
      end
    end
  end
end
