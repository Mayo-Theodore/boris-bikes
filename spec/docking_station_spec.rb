require "boris-bikes"
describe DockingStation do
    it { expect(subject).to respond_to(:release_bike) }
    it { expect(subject.release_bike).to be_an_instance_of(Bike)}
    it { expect(subject).to respond_to(:return_bike) }
    it "return a bike to DockingStation" do
        bike = subject.release_bike
        expect(subject.return_bike(bike)).to be_an_instance_of Array
    end
end