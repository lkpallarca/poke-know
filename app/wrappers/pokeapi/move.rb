module Pokeapi
  class Move
    def get_move(move)
      response = Fetcher.send_request("move", move)

      modified_response = {
        "move_name"=>response["name"],
        "move_power"=>response["power"],
        "move_accuracy"=>response["accuracy"],
        "move_pp"=>response["pp"],
        "move_type"=>response["type"]["name"],
        "move_class"=>response["damage_class"]["name"],
        "move_priority"=>response["priority"],
        "move_flavor_text"=>response["flavor_text_entries"][-3]["flavor_text"],
        "move_effect"=>response["effect_entries"][0]["effect"]
      }
    end
  end
end