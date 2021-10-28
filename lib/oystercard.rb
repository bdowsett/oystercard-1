class OysterCard
   attr_reader :balance, :entry_station, :exit_station, :journeys
   
   
   MAXIMUM_BALANCE = 90
   MINIMUM_BALANCE = 1
   MINIMUM_CHARGE = 3
   
   
   def initialize
    @balance = 0
    @journeys = {}
   end

   
   def top_up(money)
    fail "your balance is already #{MAXIMUM_BALANCE}" if money + @balance > MAXIMUM_BALANCE
    @balance += money
   end 

   def deduct(fare)
      @balance -= fare
   end 

   def in_journey?
      !!entry_station
   end

   def touch_in(station)
      fail "You do not have sufficient #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
      @entry_station = station
     # @state = true
   end

   def touch_out(station)
     # @state = false
      deduct(MINIMUM_CHARGE)
      @exit_station = station
      @journeys[@entry_station] = station
      @entry_station = nil
   end

   def minimum_amount
      @balance
   end
end 