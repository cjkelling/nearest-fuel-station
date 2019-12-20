require 'rails_helper'

describe "As a user" do
  describe "When I visit / and select Turing from the location drop down" do
    it "I should see the closest electric fuel station to me" do
      visit '/'

      select 'Turing', from: :location

      click_button('Find Nearest Station')

      expect(current_path).to eq(search_path)

      expect(page).to have_content('Station Name: Seventeenth Street Plaza')
      expect(page).to have_content('Station Address: 1225 17th St.')
      expect(page).to have_content('Station Fuel Type: ELEC')
      expect(page).to have_content('MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')

      expect(page).to have_content('Distance is 0.1 mi')
      expect(page).to have_content('Travel Time is 1 min')
      expect(page).to have_content("Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")
    end
  end
end
