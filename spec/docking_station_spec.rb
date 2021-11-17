require "boris-bikes"
describe DockingStation do
    it { expect(subject).to respond_to(:check_bike) }
    it { expect(subject.release_bike).to be_an_instance_of(Bike)}
    it { expect(subject).to respond_to(:return_bike).with(1).argument }
    it "return a bike to DockingStation" do
        bike = Bike.new
        expect(subject.return_bike(bike)).to be_an_instance_of Array
    end 
    it "throws an error" do
    expect { subject.err }.to raise_error("Sorry no bikes available")
    end

    describe "#return_bike" do
        it "raises an error if DockingStation is full" do
            bike = Bike.new
            dock = DockingStation.new
            dock.return_bike(bike)
            expect { dock.return_bike(bike) }.to raise_error("Dockingstation is full")
        end
        it "add a bike if there is no bikes" do
            bike = Bike.new
            expect(subject.return_bike(bike)).to be_an_instance_of Array
        end
    end

end