class DockingStation
  self::DEFAULT_CAPACITY = 20
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    if empty?
      raise "Sorry no bikes available"
    else
      Bike.new
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

class Bike  
  def working?
    true
  end
end

