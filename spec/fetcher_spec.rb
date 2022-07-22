require 'rails_helper'

RSpec.describe "Fetcher" do
  it "caches responses from PokeApi requests" do
    response = Fetcher.send_request("pokemon", "blaziken")
    expect(response).to include("name"=>"blaziken")
    expect(Rails.cache.read("pokemon/blaziken")).to_not eq nil
  end
end