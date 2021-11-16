class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    Bike.new 
  end

  def return_bike(bike)
    @bikes << bike
  end

  def show_bikes
    @bikes
  end
end

class Bike
  def working?
    true
  end
end

DockingStation.return_bike(Bike.new)





