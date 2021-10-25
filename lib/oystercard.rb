class OysterCard
   attr_reader :balance
   
   
   MAXIMUM_BALANCE = 90
   
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

   def touch_in
      @state = true
   end

   def touch_out
      @state = false
   end
end 

