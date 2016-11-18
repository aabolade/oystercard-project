class JourneyLog

  attr_reader :journey

  def initialize(journey_klass)
    @journey = journey_klass.new
  end

  def start
    journey.entry_station
  end


end
