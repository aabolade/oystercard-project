require_relative 'journey'
require_relative 'station'
class Oystercard


attr_reader :balance, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(journey_klass = Journey)
    @balance = 0
    @journey = journey_klass.new
  end

  def in_journey?
    !journey.is_journey_complete?
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if maximum_balance?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(xyz)
    fail "Card cannot be touched in: below £#{MINIMUM_BALANCE}" if minimum_balance?
    journey.start_a_journey(xyz)
    xyz
  end

  def touch_out(abc)
    deduct(journey.fare)
    journey.finish_a_journey(abc)
    abc
  end

  private

  def maximum_balance?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def minimum_balance?
    balance < MINIMUM_BALANCE
  end

end
