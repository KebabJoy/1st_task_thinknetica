class Train
	attr_accessor :speed
	attr_reader :type; :number; :wagonsCount; :route; :currentStation; :direction
	def initialize(type, num, wagons,route)
		@type = type
		@number = num
		@wagons_count = wagons
		@route = route
		@speed = 0
		@current_station = 0
		@direction = true # true -> forward. false -> backwards
		@route.stations[0].trains << self
	end
	def wagons_count
		@wagons_count
	end
	def current_speed
		@speed
	end
	def add_wagon
		if @speed == 0
			@wagons_count += 1
		end
	end
	def delete_wagon
		if @speed == 0
			@wagons_count -= 1
		end
	end
	def move_to_next_station

		@route.stations[@current_station].trains.delete(self)
		self.move
		if @current_station == @route.stations.length-1
			@direction = !@direction
		end
		if @direction
			@current_station += 1

		else
			@current_station -= 1
		end
		@route.stations[@current_station].add_train(self)
		if @current_station == 0
			@direction = !@direction
		end
		self.stop
	end
	def move
		@speed = 80
	end
	def stop
		@speed = 0
	end
	def current_station
		@route.stations[@current_station].name
	end
	def next_station
		if @current_station == @route.stations.length-1
			@route.stations[@current_station-1].name
		else
			@route.stations[@current_station+1].name
		end
	end
	def previous_station
		if @current_station == 0
			@route.stations[@current_station+1].name
		else
			@route.stations[@current_station-1].name
		end
	end
end



