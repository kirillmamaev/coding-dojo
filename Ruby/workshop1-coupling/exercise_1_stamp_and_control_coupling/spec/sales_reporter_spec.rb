require_relative '../lib/order'
require_relative '../lib/orders_repo'
require_relative '../lib/sales_reporter'

RSpec.describe SalesReporter do
  describe '#unpaid_orders' do
    it 'returns the unpaid orders' do
      reporter = SalesReporter.new(OrdersRepo)
      paid_order = Order.new('beer', true)
      unpaid_order = Order.new('wine', false)

      allow(OrdersRepo).to receive(:orders).and_return([paid_order, unpaid_order])

      expect(reporter.unpaid_orders).to contain_exactly(unpaid_order)
    end
  end
end
