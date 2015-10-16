require 'garage'

describe Garage do

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
    end

    subject { Garage.new }
    let(:bike) { double(:bike) }
    #bike = double(:bike, fix_bike:)
    #allow(bike).to receive(:working=).with(true).and_return(true)
    #allow(bike).to receive(:working?).and_return(true)
    #allow(bike).to receive(:fix_bike).and_return(false)
    it 'defaults capacity' do
      allow(bike).to receive(:fix_bike).and_return(false)
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Already full'
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      allow(bike).to receive(:fix_bike).and_return(false)
      subject.dock bike
      expect(subject.release_bike).to be bike
    end

    it 'does not release broken bikes' do
      bike = double(:bike, broken?: true)
      allow(bike).to receive(:fix_bike).and_return(false)
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'cannot release a broken bike'
    end

    it 'raises error when there are no more bikes available' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end

  end

  describe '#dock' do
    let(:bike) { double(:bike) }

    it { is_expected.to respond_to(:dock).with(1) }

    it 'refuses to dock bike when already at capacity' do
      allow(bike).to receive(:fix_bike).and_return(false)
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error("Already full")
    end
  end

end