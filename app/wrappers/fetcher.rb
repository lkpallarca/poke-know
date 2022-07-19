class Fetcher
  class << self
    BASE_URL = "https://pokeapi.co/api/v2".freeze

    def send_request(path, parameter)
      #long method fetching for readability
      if Rails.cache.exist?("#{path}/#{parameter}")
        puts "This api call is cached"
        response = Rails.cache.read("#{path}/#{parameter}")
      else
        connection = Faraday.new("#{BASE_URL}/#{path}/#{parameter}/")
        request = connection.get
        response = JSON.parse(request.body)

        Rails.cache.write("#{path}/#{parameter}", response, expires_in: 1.hour) if request.success?
      end
      response
    end
  end
end