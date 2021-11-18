class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
  
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def broken
    @working = false
  end
end

