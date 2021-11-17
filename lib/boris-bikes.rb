class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def err
    raise "Sorry no bikes available"
  end

  def check_bike
    if @bikes.empty?
      err
    elsif
      release_bike
    end 
  end

  def return_bike(bike)
   raise "Dockingstation is full" unless @bikes.count == 0
   @bikes << bike
  end

  def release_bike
    Bike.new
  end
end

class Bike  
  def working?
    true
  end
end

