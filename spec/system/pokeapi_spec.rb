require 'rails_helper'

RSpec.describe "PokeApi fetch responses", type: :system do
  before do
    driven_by(:rack_test)

    visit root_path
  end

  describe "regarding pokemon" do
    context "when user searches for invalid query" do
      before do
        within('.pokemon-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.pokemon-form') do
          fill_in "p", with: "blaziken"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside pokemon show" do
        before do
          within('.pokemon-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to pokemon show page with details" do
        expect(current_path).to eq(pokeknow_pokemon_path(:p))
        expect(["pokemon_sprites"]).not_to be_empty
        expect(page).to have_content("The Blaze Pokémon")
      end

      it "can search through the form again within pokemon show page" do
        within('.pokemon-form') do
          fill_in "p", with: "walrein"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_pokemon_path(:p))
        expect(["pokemon_sprites"]).not_to be_empty
        expect(page).to have_content("The Ice Break Pokémon")
      end

      it "can lead to type show by clicking a type" do
        within('.types') do
          click_link "Fighting"
        end

        expect(current_path).to eq(pokeknow_type_path(:p))
        expect(['damage_relations']).not_to be_empty
        expect(page).to have_content("Fighting type")
      end

      it "can lead to ability show by clicking an ability" do
        within('.abilities') do
          click_link "Blaze"
        end

        expect(current_path).to eq(pokeknow_ability_path(:p))
        expect(['pokemon']).not_to be_empty
        expect(page).to have_content("Blaze")
      end
    end
  end

  describe "regarding moves" do
    context "when user searches for invalid query" do
      before do
        within('.move-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.move-form') do
          fill_in "p", with: "flamethrower"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside move show" do
        before do
          within('.move-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to move show page with details" do
        expect(current_path).to eq(pokeknow_move_path(:p))
        expect(["move_name"]).not_to be_empty
        expect(page).to have_content("Flamethrower")
      end

      it "can search through the form again within move show page" do
        within('.move-form') do
          fill_in "p", with: "ice beam"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_move_path(:p))
        expect(["pokemon_sprites"]).not_to be_empty
        expect(page).to have_content("Ice Beam")
      end

      it "can lead to type show by clicking a type" do
        within('.top-screen') do
          click_link "Fire"
        end

        expect(current_path).to eq(pokeknow_type_path(:p))
        expect(['damage_relations']).not_to be_empty
        expect(page).to have_content("Fire type")
      end
    end
  end

  describe "regarding types" do
    context "when user searches for invalid query" do
      before do
        within('.type-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.type-form') do
          fill_in "p", with: "fighting"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside type show" do
        before do
          within('.type-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to type show page with details" do
        expect(current_path).to eq(pokeknow_type_path(:p))
        expect(["damage_relations"]).not_to be_empty
        expect(page).to have_content("Fighting type")
      end

      it "can search through the form again within type show page" do
        within('.type-form') do
          fill_in "p", with: "steel"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_type_path(:p))
        expect(["damage_relations"]).not_to be_empty
        expect(page).to have_content("Steel type")
      end

      it "can lead to type show by clicking a type" do
        click_link "Normal"

        expect(current_path).to eq(pokeknow_type_path(:p))
        expect(['damage_relations']).not_to be_empty
        expect(page).to have_content("Normal type")
      end
    end
  end

  describe "regarding abilities" do
    context "when user searches for invalid query" do
      before do
        within('.ability-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.ability-form') do
          fill_in "p", with: "wonder guard"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside ability show" do
        before do
          within('.ability-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to ability show page with details" do
        expect(current_path).to eq(pokeknow_ability_path(:p))
        expect(["pokemon"]).not_to be_empty
        expect(page).to have_content("Wonder Guard")
      end

      it "can search through the form again within ability show page" do
        within('.ability-form') do
          fill_in "p", with: "intimidate"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_ability_path(:p))
        expect(["pokemon"]).not_to be_empty
        expect(page).to have_content("Intimidate")
      end

      it "can lead to pokemon show by clicking a pokemon" do
        within('.pokemon-grid') do
          click_link "Shedinja"
        end

        expect(current_path).to eq(pokeknow_pokemon_path(:p))
        expect(["pokemon_sprites"]).not_to be_empty
        expect(page).to have_content("The Shed Pokémon")
      end
    end
  end

  describe "regarding machines" do
    context "when user searches for invalid query" do
      before do
        within('.machine-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.machine-form') do
          fill_in "p", with: "tm35"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside machine show" do
        before do
          within('.machine-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to machine show page with details" do
        expect(current_path).to eq(pokeknow_machine_path(:p))
        expect(["sprites"]).not_to be_empty
        expect(page).to have_content("Flamethrower")
      end

      it "can search through the form again within machine show page" do
        within('.machine-form') do
          fill_in "p", with: "tm29"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_machine_path(:p))
        expect(["sprites"]).not_to be_empty
        expect(page).to have_content("Psychic")
      end

      it "can lead to move show by clicking the move name" do
        within('.right-screen') do
          click_link "Flamethrower"
        end

        expect(current_path).to eq(pokeknow_move_path(:p))
        expect(["move_name"]).not_to be_empty
        expect(page).to have_content("Flamethrower")
      end

      it "can lead to type show by clicking a type" do
        within('.right-screen') do
          click_link "Fire"
        end

        expect(current_path).to eq(pokeknow_type_path(:p))
        expect(['damage_relations']).not_to be_empty
        expect(page).to have_content("Fire type")
      end
    end
  end

  describe "regarding item" do
    context "when user searches for invalid query" do
      before do
        within('.item-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.item-form') do
          fill_in "p", with: "rare candy"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside item show" do
        before do
          within('.item-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to pokemon show page with details" do
        expect(current_path).to eq(pokeknow_item_path(:p))
        expect(["item_sprite"]).not_to be_empty
        expect(page).to have_content("Rare Candy")
      end

      it "can search through the form again within item show page" do
        within('.item-form') do
          fill_in "p", with: "elixir"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_item_path(:p))
        expect(["item_sprite"]).not_to be_empty
        expect(page).to have_content("Elixir")
      end
    end
  end

  describe "regarding berry" do
    context "when user searches for invalid query" do
      before do
        within('.berry-form') do
          fill_in "p", with: "random gibberish"
          find_button("Search").click
        end
      end

      it "redirects to root path with notice" do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Your search keyword did not return any results.")
      end
    end

    context "when user searches for valid query" do
      before do
        within('.berry-form') do
          fill_in "p", with: "enigma-berry"
          find_button("Search").click
        end
      end

      context "then user searches for invalid query inside berry show" do
        before do
          within('.berry-form') do
            fill_in "p", with: "random gibberish"
            find_button("Search").click
          end
        end
  
        it "redirects to root path with notice" do
          expect(current_path).to eq(root_path)
          expect(page).to have_content("Your search keyword did not return any results.")
        end
      end

      it "directs to berry show page with details" do
        expect(current_path).to eq(pokeknow_berry_path(:p))
        expect(['flavors']).not_to be_empty
        expect(page).to have_content("Enigma Berry")
      end

      it "can search through the form again within berry show page" do
        within('.berry-form') do
          fill_in "p", with: "salac-berry"
          find_button("Search").click
        end

        expect(current_path).to eq(pokeknow_berry_path(:p))
        expect(["flavors"]).not_to be_empty
        expect(page).to have_content("Salac Berry")
      end
    end
  end
end