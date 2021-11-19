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
        @garage << @van_capacity.shift
        #Storing a bike in the garage
    end

    def van_receive
        @van_capacity << garage_take
        #Van takes a bike from the garage
    end
end