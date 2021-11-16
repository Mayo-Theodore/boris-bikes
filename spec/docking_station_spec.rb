require "boris-bikes"
describe DockingStation do
    it { expect(subject).to respond_to(:release_bike) }
    it { expect(subject.release_bike).to be_an_instance_of(Bike)}
end