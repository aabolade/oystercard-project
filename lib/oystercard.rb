require_relative 'journey.rb'
require_relative 'station.rb'
class Card

STARTING_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_reader :balance,:maximum_balance,:in_journey


  def initialize(balance = STARTING_BALANCE, maximum_balance = MAXIMUM_BALANCE, in_journey = false)
    @balance = balance
    @maximum_balance = maximum_balance
    @in_journey = in_journey
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{@maximum_balance}" if @balance + value > @maximum_balance
    @balance += value
  end


  def in_journey?
    return false if @journey == nil
    @journey.finish?
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM_FARE
    @journey = Journey.new
    @journey.start(station)

  end

  def touch_out(station)
     if @journey == nil
        @journey = Journey.new
        @journey.start(station = nil)
      end
        @journey.finish(station)
        current_balance = @balance
        @balance = @journey.calculating_fare(current_balance)
      end

private

  def deduct(fare)
    @balance -= fare
  end

end
