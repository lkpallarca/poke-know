module Pokeapi
  class Ability
    def get_ability(ability)
      response = Fetcher.send_request('ability', ability)
      
      effect_entry_index = 0
      unless response['generation']['name'] == 'generation-vii' || response['generation']['name'] == 'generation-viii'
        effect_entry_index = 1
      end

      if response['generation']['name'] == 'generation-vii' || response['generation']['name'] == 'generation-viii'
        flavor_text_entry_index = 7
      elsif response['generation']['name'] == 'generation-v'
        flavor_text_entry_index = 1
      elsif response['generation']['name'] == 'generation-vi'
        flavor_text_entry_index = 6
      else
        flavor_text_entry_index = 0
      end

      modified_response = {
        'name'=>response['name'],
        'ability_effect_entries'=>response['effect_entries'][effect_entry_index],
        'ability_flavor_text_entries'=>response['flavor_text_entries'][flavor_text_entry_index]['flavor_text'],
        'pokemon'=>response['pokemon']
      }
    end
  end
end