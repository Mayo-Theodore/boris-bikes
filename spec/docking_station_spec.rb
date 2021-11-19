require "docking_station"
describe DockingStation do
    it { expect(subject).to respond_to(:release_bike) }
    it { expect(subject).to respond_to(:return_bike).with(1).argument }
    it "return a bike to DockingStation" do
        bike = bike = double("bike", :working? => true, :broken => true)
        expect(subject.return_bike(bike)).to be_an_instance_of Array
    end
    
    describe "#release_bike" do
        it "raises an error if there are no bikes" do
            dock = DockingStation.new
            (dock.capacity/2.floor - 1).times do 
                dock.release_bike
            end
            expect { dock.release_bike }.to raise_error("Sorry no bikes available")
        end
        it "release a bike" do
            bike = double("bike", :working? => true, :broken => true)
            docking_station = DockingStation.new
            docking_station.return_bike(bike)
            expect(docking_station.release_bike).to be_an_instance_of Bike
        end
    end

    describe "#return_bike" do
        it "raises an error if DockingStation is full" do
            dock = DockingStation.new
            (dock.capacity/2.ceil + 1).times { dock.return_bike bike = double("bike", :working? => true, :broken => true)}
            expect { dock.return_bike bike = double("bike", :working? => true, :broken => true) }.to raise_error("Dockingstation is full")
        end
        it "add a bike if there is no bikes" do
            bike = bike = double("bike", :working? => true, :broken => true)
            expect(subject.return_bike(bike)).to be_an_instance_of Array
        end
        it 'has a default capacity of 20' do
          dock = DockingStation.new
          expect(dock.capacity).to eq 20
        end
        it 'capacity can be set to a different number' do
            random = rand(1..100)
            dock = DockingStation.new(random)
            expect(dock.capacity).to eq random
        end
    end

    describe '#broken_bikes' do 
        it 'allows a bike to be reported as broken' do
            dock = DockingStation.new
            bike2 = bike = double("bike", :working? => false, :broken => false)
            bike2.broken
            expect(bike2.working?).to eq false
        end
        it 'allows all bikes to be stored' do
            dock = DockingStation.new
            bike = bike = double("bike", :working? => true, :broken => true)
            bike2 = bike = double("bike", :working? => false, :broken => false)
            bike2.broken
            dock.return_bike(bike)
            dock.return_bike(bike2)
            expect(dock.bikes).to include(bike).and include(bike2)

        end
        it 'a broken bike is not released' do
            dock = DockingStation.new
            bike = bike = double("bike", :working? => true, :broken => true)
            dock.return_bike(bike)
            expect(dock.release_bike.working?).to eq true
        end
    end


end
