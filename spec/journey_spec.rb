require 'journey'
<<<<<<< HEAD
describe Journey do

  let( :station ){ double( :station, :name => :aldgate, :zone => 1 ) }
  let( :station_2 ){ double( :station_2, :name => :waterloo, :zone => 1 ) }

  it {is_expected.to respond_to(:start)}
  it {is_expected.to respond_to(:finish)}
  it {is_expected. to respond_to(:calculating_fare)}

  it 'expects card to store entry station upon touching in' do
    expect(subject.start(station)).to eq (subject.journey)
  end

  it 'new instance of a card to have no journeys saved' do
    expect(subject.journey).to be {}
  end

  it 'expect card to store entry and exit station' do
    subject.start(station_2)
    subject.finish(station)
    expect(subject.journey[:exit]).to eq (station.name)
  end


=======
require 'oyster_card'

describe Journey do

    it {is_expected.to respond_to :start_a_journey}
    it {is_expected.to respond_to :finish_a_journey}
    # it {is_expected.to respond_to :calculating_fare}

    it 'should remember the entry station' do
      station = 'waterloo'
      expect(subject.start_a_journey(station)).to eq 'waterloo'
    end

    it 'should remember the exit station' do
      station = 'aldgate'
      expect(subject.finish_a_journey(station)).to eq 'aldgate'
    end


    context "in_journey?" do

    it 'should show whether finish?' do
      expect(subject.finish?).to be false
    end

    it 'should show false when journey is finished' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in('entry_station')
      oyster.touch_out('exit_station')
      expect(subject.finish?).to be false
    end
  end
  context "#journeys" do

    it 'should start off as an empty array' do
      expect(subject.journeys).to eq []
    end

    it 'should record one journey' do
      subject.start_a_journey('a')
      subject.finish_a_journey('b')
      expect(subject.journeys).to include subject.current_journey
      end
  end




    # it 'should calculate the minimum fare ' do
    #   card = Oystercard.new
    #   card.top_up(10)
    #   card.touch_in('waterloo')
    #   card.touch_out('aldgate')
    #   expect(subject.calculating_fare(balance)).to eq 1
    # end

>>>>>>> 5bed250c8ace08f18ab30212d618398f9149ba1f
end
