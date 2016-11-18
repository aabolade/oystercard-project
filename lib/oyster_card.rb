require_relative 'journey'
require_relative 'station'
class Oystercard


attr_reader :balance, :entry_station, :exit_station, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(journey_klass = Journey)
    @balance = 0
    @journey = journey_klass.new
  end

  def in_journey?
    !!@entry_station
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
    @entry_station = xyz
    journey.start_a_journey(xyz)

  end

  def touch_out(abc)
    @exit_station = abc
    deduct(journey.fare)
    journey.finish_a_journey(abc)
    @entry_station = nil
    @exit_station = nil

  end

  private

  def maximum_balance?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def minimum_balance?
    balance < MINIMUM_BALANCE
  end

end
