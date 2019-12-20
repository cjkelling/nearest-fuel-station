class Search
  def initialize(location)
    @location = location
  end

  def fuel_location
    nrel_service = NrelService.new
    nrel_service.find_fuel(@location)
  end

  def map_directions
    map_service = GoogleMapsService.new
    map_service.directions(@location, fuel_location[:fuel_stations].first[:street_address])
  end
end
