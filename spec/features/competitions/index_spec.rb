require 'rails_helper'
RSpec.describe 'As a user, when I visit a competition index', type: :feature do
  before :each do
    @competition_1 = Competition.create!(name: "Football Championship" , location: "Denver", sport: "football")
    @competition_2 = Competition.create!(name: "Soccer Championship", location: "Boulder", sport: "soccer")
    @competition_3 = Competition.create!(name: "Hockey Championship", location: "Aspen", sport: "hockey")
  end
  it 'I see the names of all competitions
    Each competition name links to its show page' do

    visit competitions_path
# save_and_open_page
    within("#competition-#{@competition_1.id}") do
      expect(page).to have_content(@competition_1.name)
      expect(page).to have_link("View this Competition")
    end

    within("#competition-#{@competition_2.id}") do
      expect(page).to have_content(@competition_2.name)
      expect(page).to have_link("View this Competition")
    end

    within("#competition-#{@competition_3.id}") do
      expect(page).to have_content(@competition_3.name)
      expect(page).to have_link("View this Competition")
    end
    # save_and_open_page
  end
end
