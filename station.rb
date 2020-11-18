class Station
    attr_reader :name; :trains 
    def initialize(name)
        @trains = []
        @name = name
    end
    def trainsCount
        @trains.length
    end
    def addTrain(train)
        @trains << train
    end 
    def deleteTrain(train)
        @trains.delete(train)
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
