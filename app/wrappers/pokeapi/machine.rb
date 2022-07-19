module Pokeapi
  class Machine
    def get_machine(machine)
      item_version = Fetcher.send_request("item", machine)

      machine_identifier = item_version['machines'][5]['machine']['url'].split(/[^\d]/)[-1]
      machine_version = Fetcher.send_request("machine", machine_identifier)
      
      move_identifier = machine_version['move']['name']
      move_version = Fetcher.send_request('move', move_identifier)
      
      if item_version['effect_entries'].length == 0
        tm_effect_entry = ""
      else
        tm_effect_entry = item_version['effect_entries'][0]['effect']
      end

      additional_details = {
        "move_name"=>move_identifier,
        "tm_type"=>move_version['type']['name'],
        "tm_power"=>move_version['power'],
        "tm_accuracy"=>move_version['accuracy'],
        "tm_pp"=>move_version['pp'],
        "tm_damage_class"=>move_version['damage_class']['name'],
        "tm_flavor_text"=>move_version["flavor_text_entries"][-3]["flavor_text"],
        "tm_effect"=>tm_effect_entry
      }
      item_version.merge additional_details
    end
  end
end