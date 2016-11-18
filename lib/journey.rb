class Journey
MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_reader :journeys, :current_journey

  def initialize
  @journeys = []
  @current_journey = {}
  end

  def finish?
    @current_journey.length % 2 != 0
  end

  def start_a_journey(station)
    @entry_station = station
    @current_journey[:entry] = @entry_station

  end

  def finish_a_journey(station)
    @exit_station = station
    @current_journey[:exit] = @exit_station
    @journeys << @current_journey
    @current_journey = {}
    @exit_station
  end





  def fare
    return MINIMUM_FARE if @current_journey.empty?
    PENALTY_FARE
  end

end
