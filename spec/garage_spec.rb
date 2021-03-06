require 'garage'

describe Garage do

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
    end

    subject { Garage.new }
    it 'defaults capacity' do
      bike = double(:bike, fix_bike: false)
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Already full'
    end
  end


  describe 'container' do
    it_behaves_like 'bikeContainer'
  end


=begin
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      bike = double(:bike, broken?: false, fix_bike: false)
      subject.dock bike
      expect(subject.release_bike).to be bike
    end

    it 'does not release broken bikes' do
      bike = double(:bike, fix_bike: false, broken?: true)
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'cannot release a broken bike'
    end

    it 'raises error when there are no more bikes available' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end

  end
=end

  describe '#dock' do
    let(:bike) { double(:bike) }

    it { is_expected.to respond_to(:dock).with(1) }

    it 'refuses to dock bike when already at capacity' do
      bike = double(:bike, fix_bike: false)
      #allow(bike).to receive(:fix_bike).and_return(false)
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error("Already full")
    end
  end

end