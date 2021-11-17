# As a student
# So that I can remember people’s names
# I want an IRB application that stores the names of people I meet

require ''
describe 'remember peoples names' do
  it { expect(store_name("Bobby")).to eq "That name has been stored" }
end

def store_name(name)
  names = []
  names << name
  "That name has been stored"
end