require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error when there are no more bikes available' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1) }
  
    it 'refuses to dock bike when already at capacity' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error("Already full")
   end
  end

  it { is_expected.to respond_to(:bikes) }

  it 'can have a specified capacity when intialized' do
    cap=30
    station=DockingStation.new(cap)
    expect(station.capacity).to eq cap
  end
 
end

