class JourneyLog

  attr_reader :journey, :journeys

  def initialize(journey_klass)
    @journey = journey_klass.new
    @journeys = []
  end

  def start(entry_station)
    journey.entry_station = entry_station
    journey.current_journey[:entry] = entry_station
  end

  def finish(exit_station)
    journey.exit_station = exit_station
    journey.current_journey[:exit] = exit_station
    journeys << journey.current_journey
    journey.entry_station = nil
    exit_station
  end


end
