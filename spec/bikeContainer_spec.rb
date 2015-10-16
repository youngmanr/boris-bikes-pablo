shared_examples 'bikeContainer' do
  let(:bikeContainer) { described_class.new }
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases working bikes' do
      bike = double(:bike, fix_bike: false, broken?: false)
      subject.dock bike
      expect(subject.release_bike).to be bike
    end
    it 'does not release broken bikes' do
      bike = double(:bike, fix_bike: false,broken?: true)
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'cannot release a broken bike'
    end
    it 'raises error when there are no more bikes available' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
  end
end

