require_relative 'bike.rb'

class DockingStation

	def release_bike
		Bike.new
	end

end

=begin

p station = DockingStation.new
p bike = station.release_bike
p bike.working?
p station.dock(bike)
p station.bike

=end