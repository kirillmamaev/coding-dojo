require 'securerandom'

class Order
  attr_reader :uuid
  attr_accessor :drink, :paid

  def initialize(drink, paid)
    @uuid = SecureRandom.uuid
    @drink = drink
    @paid = paid
  end
end
