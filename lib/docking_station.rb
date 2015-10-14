require_relative 'bike'

class DockingStation

  attr_reader :bike, :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.length >= 10 #assume 10 bikes are docked when a DockingStation instance is created
      fail "No bikes available"
    else
      new_bike = Bike.new
      @bikes << new_bike
    end
    new_bike
  end

  def dock(bike)
    @bike = bike
  end

end

# p station = DockingStation.new
# p bike = station.release_bike
# p bike.working?
# p station.dock(bike)
# p station.bike
