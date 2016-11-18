require 'station'

describe Station do

  it 'should have the name waterloo upon initialization to hold the name waterloo' do
  station_name = 'waterloo'
  station = Station.new(station_name, 1)
  expect(station.name).to eq station_name
  end

  it 'should have the zone "1" upon initialization to hold the zone "1"' do
  zone = 1
  station = Station.new('waterloo', zone)
  expect(station.zone).to eq 1
  end

end
