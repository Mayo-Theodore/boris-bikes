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
            van = Van.new
            bike = Bike.new
            bike.broken
            van.van_capacity << bike
            expect(van.garage_store).to include(bike)
        end

        it "The garage fixes the bikes" do
            van = Van.new
            expect(van.garage_take).to be_an_instance_of Bike
            expect(van.garage_take.working?).to be true
        end

        it "The van collects fixed bikes from the garage" do
            van = Van.new
            expect(van.van_receive[0]).to be_an_instance_of Bike
            expect(van.van_receive[0].working?).to be true
        end

        it "The van puts the working bikes into the docking station" do
            van = Van.new
            van.van_receive
            van.dock.return_bike(van.van_capacity[0])
            expect(van.dock.bikes.length).to eq 10
        end

        it 'The van only puts broken bikes in the garage' do
            van = Van.new
            bike = Bike.new
            bike2 = Bike.new
            bike2.broken
            van.van_capacity << bike
            van.van_capacity << bike2
            expect(van.garage_store).not_to include(bike)
        end

        it 'The van only puts fixed bikes, in the docking station' do 
            van = Van.new
            bike = Bike.new
            bike2 = Bike.new
            bike.broken
            van.van_capacity << bike
            van.van_capacity << bike2
            van.put_bike_in_ds
            expect(van.dock.bikes).not_to include(bike)
        end

    end