require_relative 'docking_station.rb'

class Van
    attr_reader :dock

    def initialize
        @van_capacity = []
        @dock = DockingStation.new
    end
    def take_b_bikes
        @van_capacity << @dock.release_bike(true)
    end
end