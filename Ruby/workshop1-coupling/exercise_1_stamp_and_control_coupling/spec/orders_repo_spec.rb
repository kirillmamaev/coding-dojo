require_relative '../lib/order'
require_relative '../lib/orders_repo'

RSpec.describe OrdersRepo do
  describe '.add_order' do
    it 'adds the order to the repoistory' do
      OrdersRepo.orders.clear

      order = Order.new('wine', false)

      OrdersRepo.add_order(order)

      expect(OrdersRepo.orders).to contain_exactly(order)

      OrdersRepo.orders.clear
    end
  end
end
