class Journey
MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_reader :current_journey
  attr_accessor :entry_station, :exit_station

  def initialize
  @current_journey = {}
  @entry_station
  @exit_station
  end

  def is_journey_complete?
      entry_station.nil?
  end

  def deduct_penalty_fare
    PENALTY_FARE
  end

  def fare
    return PENALTY_FARE if is_journey_complete?
    MINIMUM_FARE
  end

end
