require_relative 'bike'

class DockingStation

  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "cannot release a broken bike" unless bikes.last.working
    bikes.pop
  end

  def dock(bike, working=true)
    fail 'Already full' if full?
    bikes << bike
    "This bike is broken" if working == false
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

