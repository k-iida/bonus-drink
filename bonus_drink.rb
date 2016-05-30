class BonusDrink
  def self.total_count_for(amount)
    service = BonusDrinkService.new(amount)
    service.execute!
    service.empty_bottle_amount
  end
end


class BonusDrinkService
  EXCHANGE_BOTTLE_AMOUNT = 3

  attr_reader :empty_bottle_amount

  def initialize(drinkable_bottle_amount)
    @drinkable_bottle_amount = drinkable_bottle_amount
    @empty_bottle_amount = 0
  end

  def execute!
    while @drinkable_bottle_amount > 0
      drink
    end
  end

  private

  def drink
    @drinkable_bottle_amount -= 1
    @empty_bottle_amount += 1

    exchange
  end

  def exchange
    if @empty_bottle_amount % EXCHANGE_BOTTLE_AMOUNT == 0
      @drinkable_bottle_amount += 1
    end
  end
end