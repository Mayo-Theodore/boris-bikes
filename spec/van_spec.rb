require "van"
describe Van do

        it "Has a method to take broken bikes from the docking station" do
            expect(Van.new).to respond_to(:take_b_bikes)
        end

        it "Takes bikes from the docking station" do
            van = Van.new
            bike = Bike.new
            bike.broken
            van.dock.return_bike(bike)
            expect(van.take_b_bikes[0]).to be_instance_of(Bike)
        end

        it "It only takes broken bikes from the docking station" do
            van = Van.new
            bike = Bike.new
            bike.broken
            puts bike.working?
            van.dock.return_bike(bike)
            puts van.dock.bikes
            expect(van.take_b_bikes[0].working?).to eq false
        end


        it "The van puts broken bikes in the garage" do
        end

        it "The garage fixes the bikes" do
        end

        it "The van only collects fixed bikes from the garage" do
        end

        it "The van puts the working bikes into the docking station" do
        end
    end