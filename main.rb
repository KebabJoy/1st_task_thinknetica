require './route.rb'
require './station.rb'
require './train.rb'

st = Station.new("belyaevo")
st1 = Station.new("konkovo")
rot = Route.new(st,st1)

tr = Train.new("Грузовой",20,8,rot)
puts tr.current_station
puts tr.next_station
tr.move_to_next_station
puts tr.next_station

