require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :dock_bike }

# Partially completed on Tuesday
#   it 'docks bikes if no bikes are already docked' do
#     bike = Bike.new
#     docking_station = DockingStation.new
#     (expect(docking_station.is_empty?).to eq true) && (expect(subject.dock_bike(bike)).to eq true)
#   end

# end



=begin
____________________________________________________________________________________________________
require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "should create a new instance of bike when asked to release_bike" do
    (expect(subject.release_bike).to be_a Bike) && (expect(subject.release_bike.working?).to eq true)
  end

end
=end

=begin
____________________________________________________________________________________________________
require 'docking_station'

describe DockingStation do

  before do
    @bike = subject.release_bike
    @working = @bike.working?
  end

  it { is_expected.to respond_to :release_bike }

  it "should create a new instance of bike when asked to release_bike" do
    (expect(@bike).to be_a Bike) && (expect(@working).to eq true)
  end
end
=end
