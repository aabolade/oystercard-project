require 'journey_log'

describe JourneyLog do
let (:journey_log) {described_class.new(Journey)}
let (:entry_station) {double :entry_station}
let (:exit_station) {double :exit_station}

describe "starting" do

  it 'should start a new journey with an entry station' do
  journey_log.start(entry_station)
  expect(journey_log.journey.entry_station).to eq entry_station
  end

end

describe "finishing" do

  it 'should finish a journey an exit station' do
  journey_log.finish(exit_station)
  expect(journey_log.journey.exit_station).to eq exit_station
  end

  it 'should return nil after touching out' do
    journey_log.start(entry_station)
    journey_log.finish(exit_station)
    expect(journey_log.journey.entry_station).to eq nil
  end


    it 'should start off as an empty array' do
      expect(journey_log.journeys).to eq []
    end

end

  describe "new instance of JourneyLog" do

  it "should take a parameter that expects an object that knows how to create journeys" do
  expect(journey_log.journey).to be_instance_of(Journey)
  end

  it 'should record one journey' do
    journey_log.start(entry_station)
    journey_log.finish(exit_station)
    expect(journey_log.journeys).to include({:entry => entry_station, :exit => exit_station})
    end

end

end
