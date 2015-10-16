require_relative 'bike'

class Garage
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "cannot release a broken bike" if bikes.last.broken?
    bikes.pop
  end

  def dock(bike)
    fail 'Already full' if full?
    bike.fix_bike
    bikes << bike
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

