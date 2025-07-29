require 'securerandom'

class Order
  attr_reader :uuid, :drink, :paid_at

  def initialize(drink, paid)
    @uuid = SecureRandom.uuid
    @drink = drink
    
    if paid
      set_as_paid
    else
      @paid_at = nil
    end
  end

  def set_as_paid
    @paid_at = Time.now
  end

  def paid
    !!@paid_at
  end
end
