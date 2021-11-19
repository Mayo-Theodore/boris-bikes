require_relative 'docking_station.rb'

class Van
    attr_reader :dock
    attr_reader :van_capacity

    def initialize
        @van_capacity = []
        @dock = DockingStation.new
        @garage = []
    end
    def take_b_bikes
        @van_capacity << @dock.release_bike(true)
    end

    def garage_take
        bike = Bike.new
        #Taking a bike from the garage
    end

    def garage_store
      if @van_capacity.empty?
        raise "There are no bikes"
      else 
        @last_bike = @van_capacity[-1]
        bike_to_store = broken_bike
        @garage << bike_to_store
      end
        #Storing a bike in the garage
    end

    def van_receive
        @van_capacity << garage_take
        #Van takes a bike from the garage
    end

    def fixed_bike
        if @van_capacity[0].working? == false
          broke_bike = @van_capacity.shift
          @van_capacity << broke_bike
          if @last_bike == broke_bike
            raise "All bikes are broken!"
          end
          fixed_bike
        end
      end
    
      def broken_bike
        if @van_capacity[0].working? == true
          broke_bike = @van_capacity.shift
          @van_capacity << broke_bike
          if @last_bike == broke_bike
            raise "All bikes are good!"
          end
          broken_bike
        else
          @van_capacity.shift
        end
      end
      
      def put_bike_in_ds
        if @van_capacity.empty?
            raise "There are no bikes"
          else 
            @last_bike = @van_capacity[-1]
            bike_to_store = fixed_bike
            @dock.return_bike(bike_to_store)
          end
      end
end