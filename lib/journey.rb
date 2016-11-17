class Journey
MINIMUM_FARE = 1
attr_reader :journey, :journeys, :calculating_fare
  def initialize
    @journeys = []
    @journey = {}
end


  def start(station)
    @journey[:entry] = station.name
    @journey
  end

  def finish?
    @journey.size % 2 != 0
  end

  def finish(station)
    @journey[:exit] = station.name
    @journeys << @journey
  end

  def calculating_fare(balance)
      if @journey[:entry] == nil || @journey[:exit] == nil
        balance -= 6
      else
        balance -= MINIMUM_FARE
  end
end


end
