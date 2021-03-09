require 'rails_helper'
RSpec.describe 'As a user, when I visit a competition index', type: :feature do
  before :each do
    @competition_1 = Competition.create!(name: "Homer" , location: "Denver", sport: "football")
    @competition_2 = Competition.create!(name: "Marge", location: "Boulder", sport: "soccer")
    @competition_3 = Competition.create!(name: "Bart", location: "Aspen", sport: "hockey")
  end
  it 'I see the names of all competitions
    Each competition name links to its show page' do

    visit competitions_path
# save_and_open_page
    within("#patients") do
      expect(page).to have_content(@competition_1.name)
      expect(page).to have_link("View this Competition")
    end

    within("#patients") do
      expect(page).to have_content(@competition_2.name)
      expect(page).to have_link("View this Competition")
    end

    within("#patients") do
      expect(page).to have_content(@competition_3.name)
      expect(page).to have_link("View this Competition")
    end
  end
end
