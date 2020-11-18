class Route
    attr_reader :stations
    def initialize(start,finish)
        @stations = []
        @stations << finish
        @stations.unshift(start)
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

