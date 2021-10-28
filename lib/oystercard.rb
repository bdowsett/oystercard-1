class OysterCard
   attr_reader :balance, :entry_station
   
   
   MAXIMUM_BALANCE = 90
   MINIMUM_BALANCE = 1
   MINIMUM_CHARGE = 3
   
   
   def initialize
    @balance = 0
   end

   
   def top_up(money)
    fail "your balance is already #{MAXIMUM_BALANCE}" if money + @balance > MAXIMUM_BALANCE
    @balance += money
   end 

   def deduct(fare)
      @balance -= fare
   end 

   def in_journey?
      @state
   end

   def touch_in(station)
      @entry_station = station
      @state = true
   end

   def touch_out
      @in_journey = false
      deduct(MINIMUM_CHARGE)
      @entry_station = nil
   end

   def minimum_amount
    fail "You do not have sufficient #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
      @balance
   end
end 