require 'station'

describe Station do
    describe "#initialize" do
    it "has a name and zone on initialisation" do 
        station = Station.new("Paddington", 1)
        expect(station.name).to eq "Paddington"
        expect(station.zone).to eq 1
    end 
end 
    
end