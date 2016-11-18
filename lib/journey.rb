class Journey
MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_reader :journeys, :current_journey

  def initialize
  @journeys = []
  @current_journey = {}
  @entry_station
  @exit_station
  end

  def is_journey_complete?
    @entry_station == nil
  end

  def start_a_journey(station)
    @entry_station = station
    @current_journey[:entry] = @entry_station

  end

  def finish_a_journey(station)
      @current_journey[:exit] = station
      @journeys << @current_journey
      @entry_station = nil
      station
  end





  def fare
    return PENALTY_FARE if is_journey_complete?
    MINIMUM_FARE
  end

end
