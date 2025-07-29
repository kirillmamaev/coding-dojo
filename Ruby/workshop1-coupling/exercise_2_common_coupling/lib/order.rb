require 'securerandom'

class Order
  attr_accessor :drink, :paid
  attr_reader :uuid

  def initialize(drink, paid)
    @uuid = SecureRandom.uuid
    @drink = drink
    @paid = paid
  end
end
