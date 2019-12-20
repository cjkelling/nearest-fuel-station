require 'rails_helper'

describe "As a user" do
  describe "When I visit / and select Turing from the location drop down" do
    it "I should see the closest electric fuel station to me" do
      visit '/'

      select 'Turing', from: :location

      click_button('Find Nearest Station')

      expect(current_path).to eq(search_path)

      expect(page).to have_content('Station Name')
      expect(page).to have_content('Station Address')
      expect(page).to have_content('Station Fuel Type')
      expect(page).to have_content('Station Access Times')

      expect(page).to have_content('Distance is 0.1 miles')
      expect(page).to have_content('Travel Time is 1 min')
      expect(page).to have_content("Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")
    end
  end
end
