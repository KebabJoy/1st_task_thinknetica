class Station
    attr_reader :name; :trains
    def initialize(name)
        @name = name
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
        return @trains.select {|train| train.type == type }
    end
end

class Route
    attr_reader :start; :finish; :route
    def initialize(start,finish)
        @start = start
        @finish = finish
    end
    def addStation(station)
        @route << route
    end
end


class Train
    attr_reader :type; :number; :wagonsCount
    def initialize(type, num, wagons)
        @type = type
        @number = num
        @wagonsCount = wagons
    end
    
end