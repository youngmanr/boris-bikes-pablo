require 'docking_station'

describe DockingStation do
  #method here??
  bike_overflow = DockingStation.new
  10.times do
    bike_overflow.release_bike
  end

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1) }
  it { is_expected.to respond_to(:bike) }

  it 'raises error on no bikes available' do
    expect {bike_overflow.release_bike}.to raise_error("No bikes available")
  end

end



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
