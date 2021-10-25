require 'oystercard'

describe OysterCard do
    it "initializes with a zero balance" do 
     expect(subject.balance).to eq(0)
    end

    describe "#top_up" do
      oystercard = OysterCard.new
      it "allows user to increase balance" do
        expect(oystercard).to respond_to(:top_up).with(1).argument
      end
      it 'can top up balance' do
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      end 
      it "balance cannot exceed £90" do 
        maximum_balance = OysterCard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect { subject.top_up 1}.to raise_error "your balance is already #{maximum_balance}"
      end 
    end  
end
