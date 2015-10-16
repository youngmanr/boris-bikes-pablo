require_relative 'bike'
require_relative 'bikeContainer'

class DockingStation
  include BikeContainer
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

=begin
  def release_bike
    fail 'No bikes available' if empty?
    fail "cannot release a broken bike" if bikes.last.broken?
    bikes.pop
  end
=end


  def release_broken_bike
    broken_bike = nil
    broken_bike = bikes.select { |bike| bike.broken? }.last
    bikes.delete(broken_bike)
    broken_bike
  end

  def dock(bike)
    fail 'Already full' if full?
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

