module Pokemon
  module Api
    class Client
      def get_pokemon_list(offset)
        fetch_list("pokemon", offset)
      end

      def get_item_list(offset)
        fetch_list("item", offset)
      end

      def get_berry_list(offset)
        fetch_list("berry", offset)
      end

      def get_machine_list(offset)
        fetch_list("machine", offset)
      end

      def get_move_list(offset)
        fetch_list("move", offset)
      end

      private

      def fetch_list(path, offset)
        if Rails.cache.exist?("#{path}/#{offset}/all")
          puts "This api call is cached"
          response = Rails.cache.read("#{path}/#{offset}/all")
        else
          connection = Faraday.new("https://pokeapi.co/api/v2/#{path}/?offset=#{offset}&limit=10")
          request = connection.get
          response = JSON.parse(request.body)
  
          Rails.cache.write("#{path}/#{offset}/all", response, expires_in: 2.hours) if request.success?
        end
        #long method fetching for readability
        response
      end
    end
  end
end

