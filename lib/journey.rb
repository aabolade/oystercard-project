class Journey
MINIMUM_FARE = 1
<<<<<<< HEAD
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


=======

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
    @exit_station


  end





  # def calculating_fare(balance)
  #   @balance = balance
  #     @balance -= MINIMUM_FARE
  # end

>>>>>>> 5bed250c8ace08f18ab30212d618398f9149ba1f
end
