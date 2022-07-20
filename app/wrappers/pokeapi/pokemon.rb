module Pokeapi
  class Pokemon
    def get_pokemon(pokemon)
      pokemon_details = Fetcher.send_request("pokemon", pokemon)
      species_version = Fetcher.send_request('pokemon-species', pokemon)

      if species_version['generation']['name'] == "generation-v"
        translation_index = 1
      elsif species_version['generation']['name'] == "generation-vi"
        translation_index = 6
      elsif species_version['generation']['name'] == "generation-vii" || species_version['generation']['name'] == "generation-viii"
        translation_index = 7
      else
        translation_index = 2
      end

      additional_details = {
        'pokemon_flavor_text'=>species_version['flavor_text_entries'][translation_index]["flavor_text"],
        'pokedex_number'=>species_version['pokedex_numbers'][0]['entry_number'],
        'pokemon_generation'=>species_version['generation']['name'],
        'pokemon_genus'=>species_version['genera'][-3]['genus'],
        'pokemon_official_sprite'=>pokemon_details['sprites']['other']['official-artwork']['front_default'],
        'pokemon_sprites'=>[
          pokemon_details['sprites']['front_default'],
          pokemon_details['sprites']['back_default'],
          pokemon_details['sprites']['front_shiny'],
          pokemon_details['sprites']['back_shiny'],
        ]
      }
      pokemon_details.merge additional_details
    end
  end
end