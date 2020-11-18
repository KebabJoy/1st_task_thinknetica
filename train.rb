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
    def moveToNextStation
        
        @route.stations[@currentStation].trains.delete(self)
        self.move
        if @currentStation == @route.stations.length()-1 
           @direction = !@direction 
        end
        if @direction
            @currentStation += 1
           
        else
            @currentStation -= 1
        end
        @route.stations[@currentStation].addTrain(self)
        if @currentStation == 0
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
        @route.stations[@currentStation].name
    end
    def nextStation
        if @currentStation == @route.stations.length()-1 
            @route.stations[@currentStation-1].name
        else
            @route.stations[@currentStation+1].name
        end
    end
    def previousStation
        if @currentStation == 0
            @route.stations[@currentStation+1].name
        else
            @route.stations[@currentStation-1].name
        end
    end
end



