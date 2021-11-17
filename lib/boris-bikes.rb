class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def err
    raise "error"
  end

  def check_bike
    if @bikes.empty?
      err
    else
    release_bike
    end 
  end

  def return_bike(bike)
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

