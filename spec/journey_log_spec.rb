require 'journey_log'

describe JourneyLog do
let (:journey_log) {described_class.new(Journey)}

describe "starting" do

  it 'should start a new journey with an entry station' do
  expect(journey_log.start).to eq journey_log.journey.entry_station
  end

end

  describe "new instance of JourneyLog" do

  it "should take a parameter that expects an object that knows how to create journeys" do
  expect(journey_log.journey).to be_instance_of(Journey)
  end

end

end
