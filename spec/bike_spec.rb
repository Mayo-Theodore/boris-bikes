require "docking_station"
describe Bike do
  it { expect(subject).to respond_to :working? }
  it { expect(subject.working?).to be(true).or be(false) }
  # it { expect(subject.working?).to be_in([true, false])}
end