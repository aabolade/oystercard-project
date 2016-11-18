require_relative 'journey'
require_relative 'station'
require_relative 'journey_log'
class Oystercard


attr_reader :balance, :journey_log

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize(journey_log_klass = JourneyLog)
    @balance = 0
    @journey_log = journey_log_klass.new
  end

  def in_journey?
    !journey_log.journey.is_journey_complete?
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if maximum_balance?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Card cannot be touched in: below £#{MINIMUM_BALANCE}" if minimum_balance?
    deduct(journey_log.journey.deduct_penalty_fare) if in_journey?
    journey_log.start(station)
    station
  end

  def touch_out(station)
    deduct(journey_log.journey.fare)
    journey_log.finish(station)
    station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def maximum_balance?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def minimum_balance?
    balance < MINIMUM_BALANCE
  end


end
