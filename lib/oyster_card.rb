require_relative 'journey'
require_relative 'station'
class Oystercard


attr_reader :balance, :entry_station, :exit_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
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
    @journey = Journey.new
    @journey.start_a_journey(xyz)

  end

  def touch_out(abc)
    @exit_station = abc
    @journey.finish_a_journey(abc)
    deduct(MINIMUM_CHARGE)
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
