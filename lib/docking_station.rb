require_relative 'bike'

class DockingStation

  def initialize
    @empty = false 
  end 

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    true
  end

  def is_empty?
    @empty
  end

end
