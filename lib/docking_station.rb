require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    #@DEFAULT_CAPACITY = 20
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Already full' if full?
    @bikes << bike
  end
  
  private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length >= 20
  end
end

=begin
p station = DockingStation.new
p bike = Bike.new
p bike2 = Bike.new
p station.dock(bike)
p station.dock(bike2)

=end

