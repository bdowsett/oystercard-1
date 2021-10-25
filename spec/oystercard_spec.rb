require 'oystercard'

describe OysterCard do
    it "initializes with a zero balance" do 
     expect(subject.balance).to eq(0)
    end

    describe "#top_up" do
      oystercard = OysterCard.new
      it "allows user to increase balance" do
        expect(oystercard).to respond_to(:top_up)
      end
    end
    
end