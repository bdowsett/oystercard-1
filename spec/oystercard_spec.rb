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
      it "balance should deduct money from balance to pay for journey" do
        subject.top_up(20)
        expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
      end
    
    describe "#in_journey" do
      it " is initially not in a journey" do
        expect(subject).not_to be_in_journey
      end

      it "can touch in" do
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it " returns false if touch_out" do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
    
    describe "minimum amount" do
      it "will not touch in if it's below 1 pound" do 
        minimum_balance = OysterCard::MINIMUM_BALANCE
        expect {subject.minimum_amount}.to raise_error "You do not have sufficient #{minimum_balance}"
      end 
    end
  end
end
end
