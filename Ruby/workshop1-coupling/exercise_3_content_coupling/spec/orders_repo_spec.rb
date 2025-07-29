
require_relative '../lib/order'
require_relative '../lib/orders_repo'

RSpec.describe OrdersRepo do
  describe '.add_order' do
    it 'adds the order to the repoistory' do
      orders_repo = OrdersRepo.new

      order = Order.new('wine', false)

      orders_repo.add_order(order)

      expect(orders_repo.orders).to contain_exactly(order)
    end
  end
end
