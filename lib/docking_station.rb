require_relative './bike.rb'
require_relative './bikecontainer.rb'

class DockingStation
  include BikeContainer
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    (capacity/2.floor - 1).times do 
      @bikes << Bike.new
    end

  end

  def release_bike(broken = false)
    if empty?
      raise "Sorry no bikes available"
    else
      @last_bike = @bikes[-1]
      if broken == true
        broken_bike(@bikes,@last_bike)
      elsif broken == false
        fixed_bike(@bikes,@last_bike)
        @bikes.shift
      end
    end 
  end

  def return_bike(bike)
    if full?
      raise "Dockingstation is full"
    else 
      @bikes << bike
    end
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

end

