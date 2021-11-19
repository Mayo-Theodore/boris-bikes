require_relative './bike.rb'

class DockingStation
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
        broken_bike
      elsif broken == false
        first_bike
        @bikes.shift
      end
    end 
  end

  def first_bike
    if @bikes[0].working? == false
      broke_bike = @bikes.shift
      @bikes << broke_bike
      if @last_bike = broke_bike
        raise "All bikes are broken!"
      end
      first_bike
    end
  end

  def broken_bike
    if @bikes[0].working? == true
      broke_bike = @bikes.shift
      @bikes << broke_bike
      if @last_bike == broke_bike
        raise "All bikes are good!"
      end
      broken_bike
    else
      @bikes.shift
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

