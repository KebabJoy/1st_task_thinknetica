class Station
    attr_reader :name; :trains 
    def initialize(name)
        @name = name
        @trains = []
    end
    def trainsCount
        @trains.length
    end
    def addTrain(train)
        @trains << train
    end 
    def trains
        @trains
    end
    def trainsByType(type)
        @trains.select {|train| train.type == type }                 
    end
    def departTrain(train)
        if trains.include?(train)
            trains.delete(train)
        else
            puts "Поезда нет на этой станции"
        end
    end
end

class Route
    attr_reader :stations
    def initialize(start,finish)
        @stations.unshift(start)
        @stations << finish
    end
    def addStation(station)
        @stations.insert(stations.index(stations.last())-1,station)
    end
    def deleteStation(station)
        @stations.delete_at(station)
    end
    def printStations
        stations.each do |station|
            puts station
        end
    end
end


class Train
    attr_accessor :speed
    attr_reader :type; :number; :wagonsCount; :route; :currentStation; :direction
    def initialize(type, num, wagons,route)
        @type = type
        @number = num
        @wagonsCount = wagons
        @route = route
        @speed = 0
        @currentStation = 0
        @direction = true # true -> forward. false -> backwards
        @route.stations[0].trains << self
    end
    def wagonsCount
        @wagonsCount
    end
    def currentSpeed
        @speed
    end
    def addWagon
        if @speed == 0
            @wagonsCount += 1
        end
    end
    def deleteWagon
        if @speed == 0
            @wagonsCount -= 1
        end
    end
    def nextStation
        @route.stations[currentStation].trains.delete(self)
        self.move
        if currentStation == route.stations.length()-1 
           @direction = !@direction 
        end
        if @direction
            @currentStation += 1
           
        else
            @currentStation -= 1
        end
        @route.stations[currentStation] << self
        if currentStation == 0
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
    def currentStation
        @currentStation
    end
    def nextStation
        if @currentStation == route.stations.length()-1 
            @route.stations[@currentStation-1]
        else
            @route.stations[@currentStation+1]
        end
    end
    def previousStation
        if @currentStation == 0
            @route.stations[@currentStation+1]
        else
            @route.stations[@currentStation-1]
        end
    end
end




