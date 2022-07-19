module Pokeapi
  class Item
    def get_item(item)
      response = Fetcher.send_request("item", item)

      if response['effect_entries'].length == 0
        item_effect_entry = ""
      else
        item_effect_entry = response['effect_entries'][0]['effect']
      end

      modified_response = {
        "item_name"=>response["name"],
        "item_sprite"=>response["sprites"]["default"],
        "item_category"=>response["category"]["name"],
        "item_cost"=>response["cost"],
        "item_flavor_text"=>response["flavor_text_entries"][-3]["text"],
        "item_effect"=>item_effect_entry
      }
    end
  end
end