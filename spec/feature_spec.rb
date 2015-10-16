=begin
require './lib/docking_station'
require './lib/vans'
require './lib/garage'

station = DockingStation.new
bike = Bike.new
van = Van.new
garage = Garage.new
# # p bike2 = Bike.new
station.dock(bike)
bike.report_broken
# # p station.dock(bike2)
# # p '------------------'
# p
# p 'Test that a new DockingStation instance can have a capacity of 30'
# p station2 = DockingStation.new(30)
# p
# p '------------------'
#p 'Reporting a bike as broken when returning it'
#station.dock(bike, false)
# p '------------------'
# p 'test whether broken bikes can be released'
# #p station.release_bike
#p broken_bike = docking_station.release(broken_bike)

p "-----------------------------"
p broken_bike = station.release_broken_bike
p van.dock(broken_bike)
p broken_bike = van.release_broken_bike
p garage.dock(broken_bike)
p bike = garage.release_bike
p van.dock(bike)
p bike = van.release_bike
p station.dock(bike)
=end
