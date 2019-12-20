class GoogleMapsService
  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE_API_KEY']
    end
  end

  def directions(start, finish)
    response = conn.get("https://maps.googleapis.com/maps/api/directions/json", {
      origin: start,
      destination: finish
    })
    JSON.parse(response.body, symbolize_names: true)
  end
end
