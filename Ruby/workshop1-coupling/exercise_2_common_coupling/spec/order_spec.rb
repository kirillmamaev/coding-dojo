require_relative '../lib/order'

RSpec.describe Order do
  describe '#paid' do
    it "initialises paid to false" do
      order = Order.new('beer', false)
      expect(order.paid).to be false
    end
  end

  describe "#uuid" do
    it 'initialises with a uuid'  do
      allow(SecureRandom).to receive(:uuid).and_return("uuid")

      order = described_class.new('beer', false)

      expect(order.uuid).to eq('uuid')
    end
  end
end
