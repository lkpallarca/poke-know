module Pokeapi
  class Type
    def get_type(type)
      Fetcher.send_request('type', type)
    end
  end
end