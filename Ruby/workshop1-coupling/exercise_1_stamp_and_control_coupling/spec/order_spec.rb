require_relative '../lib/order'

RSpec.describe Order do
  describe '#paid' do
    it "initialises paid to false" do
      order = Order.new('beer', false)
      expect(order.paid).to be false
    end
  end
end
