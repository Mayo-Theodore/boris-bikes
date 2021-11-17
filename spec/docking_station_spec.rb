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
    expect { subject.err }.to raise_error("error")
    end
end