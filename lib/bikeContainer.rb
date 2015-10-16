module BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    fail "cannot release a broken bike" if bikes.last.broken?
    bikes.pop
  end

  def release_broken_bike
    broken_bike = nil
    broken_bike = bikes.select { |bike| bike.broken? }.last
    bikes.delete(broken_bike)
    broken_bike
  end

end