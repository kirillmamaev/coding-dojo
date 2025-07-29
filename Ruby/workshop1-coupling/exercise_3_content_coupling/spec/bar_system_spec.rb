
require_relative '../lib/bar_system'

RSpec.describe BarSystem do
  describe '#order_drink' do
    it 'create the order' do
      printer = instance_double(Printer)
      orders_repo = instance_double(OrdersRepo)
      bar_system = BarSystem.new(printer, orders_repo)
      order = instance_double(Order)

      allow(Order).to receive(:new).and_return(order)
      allow(orders_repo).to receive(:add_order)

      bar_system.order_drink('beer')

      expect(Order).to have_received(:new).with('beer', false)
    end

    it 'adds the order to the OrdersRepo' do
      printer = instance_double(Printer)
      orders_repo = instance_double(OrdersRepo)
      bar_system = BarSystem.new(printer, orders_repo)
      order = instance_double(Order)

      allow(Order).to receive(:new).and_return(order)
      allow(orders_repo).to receive(:add_order)

      bar_system.order_drink('beer')

      expect(orders_repo).to have_received(:add_order).with(order)
    end
  end

  describe '#pay_order' do
    context 'when the order exists' do
      it "sets the order's paid to true" do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)
        order = instance_double(Order, uuid: 'uuid')

        allow(orders_repo).to receive(:orders).and_return([order, instance_double(Order, uuid: 'another uuid')])
        allow(order).to receive(:set_as_paid)
        allow(order).to receive(:paid).and_return(true)

        bar_system.pay_order('uuid')
        expect(order).to have_received(:set_as_paid)
        expect(order.paid).to be(true)
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error' do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)

        allow(orders_repo).to receive(:orders).and_return([])

        expect { bar_system.pay_order('uuid') }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#print_tax_invoice' do
    context 'when the order exists' do
      it 'tells the printer to print the tax invoice' do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)
        order = instance_double(Order, uuid: 'uuid', drink: 'beer')

        allow(orders_repo).to receive(:orders).and_return([order, instance_double(Order, uuid: 'another uuid')])
        allow(printer).to receive(:print_tax_invoice)

        bar_system.print_tax_invoice('uuid')

        expect(printer).to have_received(:print_tax_invoice).with('uuid', 'beer')
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error', :aggregate_failure do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)

        allow(orders_repo).to receive(:orders).and_return([])
        allow(printer).to receive(:print_tax_invoice)

        expect { bar_system.print_tax_invoice('uuid') }.to raise_error(ArgumentError)
        expect(printer).not_to have_received(:print_tax_invoice)
      end
    end
  end

  describe '#print_customer_copy' do
    context 'when the order exists' do
      it 'tells the printer to print the customer copy' do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)
        order = instance_double(Order, uuid: 'uuid', drink: 'beer')

        allow(orders_repo).to receive(:orders).and_return([order, instance_double(Order, uuid: 'another uuid')])
        allow(printer).to receive(:print_customer_copy)

        bar_system.print_customer_copy('uuid')

        expect(printer).to have_received(:print_customer_copy).with('uuid', 'beer')
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error', :aggregate_failure do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)

        allow(orders_repo).to receive(:orders).and_return([])
        allow(printer).to receive(:print_customer_copy)

        expect { bar_system.print_customer_copy('uuid') }.to raise_error(ArgumentError)
        expect(printer).not_to have_received(:print_customer_copy)
      end
    end
  end

  describe 'print_refund' do
    context 'when the order exists' do
      it 'tells the printer to print the refund' do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)
        order = instance_double(Order, uuid: 'uuid', drink: 'beer')

        allow(orders_repo).to receive(:orders).and_return([order, instance_double(Order, uuid: 'another uuid')])
        allow(printer).to receive(:print_refund)

        bar_system.print_refund('uuid')

        expect(printer).to have_received(:print_refund).with('uuid')
      end
    end

    context "when the order doesn't exist" do
      it 'raises an error', :aggregate_failure do
        printer = instance_double(Printer)
        orders_repo = instance_double(OrdersRepo)
        bar_system = BarSystem.new(printer, orders_repo)

        allow(orders_repo).to receive(:orders).and_return([])
        allow(printer).to receive(:print_refund)

        expect { bar_system.print_refund('uuid') }.to raise_error(ArgumentError)
        expect(printer).not_to have_received(:print_refund)
      end
    end
  end
end
