module Pokemon
  module Api
    class Client
      BASE_URL = "https://pokeapi.co/api/v2".freeze

      def pokemon(pokemon)
        send_request("pokemon", pokemon)
      end

      def item(item)
        send_request("item", item)
      end

      def berry(berry)
        send_request("berry", berry)
      end

      def machine(machine)
        send_request("machine", machine)
      end

      def move(move)
        send_request("move", move)
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

