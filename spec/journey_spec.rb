require 'journey'
require 'oyster_card'

describe Journey do

    it {is_expected.to respond_to :start_a_journey}
    it {is_expected.to respond_to :finish_a_journey}
    let (:entry_station) {double :entry_station}
    let (:exit_station) {double :exit_station}
    let (:journey) {described_class.new}
    # it {is_expected.to respond_to :calculating_fare}

    it 'should remember the entry station' do
      expect(journey.start_a_journey(entry_station)).to eq entry_station
    end

    it 'should remember the exit station' do
      expect(journey.finish_a_journey(entry_station)).to eq entry_station
    end


    context "in_journey?" do

    it 'should show whether finish?' do
      expect(journey.finish?).to be false
    end

    it 'should show false when journey is finished' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(journey.finish?).to be false
    end
  end
  context "#journeys" do

    it 'should start off as an empty array' do
      expect(journey.journeys).to eq []
    end

    it 'should record one journey' do
      journey.start_a_journey(entry_station)
      journey.finish_a_journey(exit_station)
      expect(journey.journeys).to include {:entry => entry_station, :exit => exit_station}
      end
  end


  describe "calculatiing fare" do

    it "should return the minimum fare when you touch in and touch out" do
      journey.start_a_journey(entry_station)
      journey.finish_a_journey(exit_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it "should return a penalty fare when you touch in without a touch out" do
      journey.start_a_journey(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end


    # it 'should calculate the minimum fare ' do
    #   card = Oystercard.new
    #   card.top_up(10)
    #   card.touch_in('waterloo')
    #   card.touch_out('aldgate')
    #   expect(journey.calculating_fare(balance)).to eq 1
    # end

end
