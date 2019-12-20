class NrelService
  def conn
    Faraday.new(url: 'https://developer.nrel.gov') do |f|
      f.adapter Faraday.default_adapter
      f.params[:api_key] = ENV['NREL_API_KEY']
    end
  end

  def find_fuel(current)
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json", {
      location: current,
      limit: 1
    })
    JSON.parse(response.body, symbolize_names: true)
  end
end
