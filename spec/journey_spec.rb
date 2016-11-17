require 'journey'
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


end
