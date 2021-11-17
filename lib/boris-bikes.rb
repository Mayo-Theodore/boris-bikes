class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.empty?
      raise "Sorry no bikes available"
    else
      Bike.new
    end 
  end

  def return_bike(bike)
    if @bikes.count == 0
      @bikes << bike
    else 
      raise "Dockingstation is full"
    end
  end

end

class Bike  
  def working?
    true
  end
end

