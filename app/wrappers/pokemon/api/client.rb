module Pokemon
  module Api
    class Client
      BASE_URL = "https://pokeapi.co/api/v2".freeze

      def pokemon(name)
        send_request("pokemon", name)
      end

      private

      def send_request(path, parameter)
        connection = Faraday.new("#{BASE_URL}/#{path}/#{parameter}/")
        response = connection.get
        JSON.parse(response.body)
      end
    end
  end
end

