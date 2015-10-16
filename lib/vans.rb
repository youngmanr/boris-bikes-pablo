class Van
	attr_accessor :capacity
  	DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  def dock(bike)
    fail 'Already full' if full?
    bikes << bike
  end
  
  def release_bike
    fail 'No bikes available' if empty?
    working_bike = nil
    working_bike = bikes.select { |bike| !bike.broken? }.last
	bikes.delete(working_bike)
	fail "cannot release a broken bike" if bikes.last.broken?
	working_bike
  end

  def release_broken_bike
  	broken_bike = nil
	broken_bike = bikes.select { |bike| bike.broken? }.last
	bikes.delete(broken_bike)
	broken_bike
  end

  private

  attr_reader :bikes
  def empty?
    bikes.empty?
  end

  def full?
    bikes.length >= capacity
  end

end