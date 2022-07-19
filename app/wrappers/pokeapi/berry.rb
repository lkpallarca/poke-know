module Pokeapi
  class Berry
    def get_berry(berry)
      item_version = Fetcher.send_request("item", berry)
      berry_version = Fetcher.send_request("berry", berry.split("-")[0])
      additional_details = {
        'berry_sprite'=>item_version['sprites']['default'],
        "berry_flavor_text"=>item_version['flavor_text_entries'][0]['text'],
        "berry_effect_entries"=>item_version['effect_entries'][0]['effect'],
        "berry_category"=>item_version['category']['name']
      }
      berry_version.merge additional_details
    end
  end
end