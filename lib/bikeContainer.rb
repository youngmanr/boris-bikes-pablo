module BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    fail "cannot release a broken bike" if bikes.last.broken?
    bikes.pop
  end
end