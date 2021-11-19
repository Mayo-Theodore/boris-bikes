require "bikecontainer"
require "docking_station"
require "van"

describe BikeContainer do

it "If all bikes are fixed, and one is to be put in the garage, an error message is raised" do
    van = Van.new
    bike = Bike.new
    van.van_capacity << bike
    expect {van.broken_bike(van.van_capacity,bike)}.to raise_error
    
end

it "If all bikes are broken, and one is to be put in the docking station, an error message is raised" do
    van = Van.new
    bike = Bike.new
    bike.broken
    van.van_capacity << bike
    expect {van.fixed_bike(van.van_capacity,bike)}.to raise_error
end

end