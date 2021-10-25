require 'oystercard'

describe OysterCard do
    it "initializes with a zero balance" do 
     expect(subject.balance).to eq(0)
end
end 