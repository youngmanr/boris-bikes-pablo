require_relative 'bike'
require_relative 'bikeContainer'

class Garage
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

