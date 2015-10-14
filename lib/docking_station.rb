require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    #@capacity = 20
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Already full' if @bikes.length >= 20 # == capacity?
    @bikes << bike
  
  end
end

=begin
p station = DockingStation.new
p bike = Bike.new
p bike2 = Bike.new
p station.dock(bike)
p station.dock(bike2)

=end

