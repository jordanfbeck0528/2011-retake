require 'rails_helper'
RSpec.describe 'As a user, when I visit a competition show page', type: :feature do
  before :each do
    @competition_1 = Competition.create!(name: "Football Championship" , location: "Denver", sport: "football")
    @competition_2 = Competition.create!(name: "Soccer Championship", location: "Boulder", sport: "soccer")
    @competition_3 = Competition.create!(name: "Hockey Championship", location: "Aspen", sport: "hockey")

    @team_1 = Team.create!(hometown: "Aspen", nickname: "good team", sport: "football")
    @team_2 = Team.create!(hometown: "Boulder", nickname: "awesome team", sport: "football")
    @team_3 = Team.create!(hometown: "Denver", nickname: "best team", sport: "soccer")
    @team_4 = Team.create!(hometown: "Denver", nickname: "pretty ok team", sport: "soccer")
    @team_5 = Team.create!(hometown: "Pueblo", nickname: "decent team", sport: "hockey")
    @team_6 = Team.create!(hometown: "Larkspur", nickname: "favorite team", sport: "hockey")

    @player_1 = Player.create!(name: "tom", age: 12)
    @player_2 = Player.create!(name: "jim", age: 12)
    @player_3 = Player.create!(name: "bill", age: 13)
    @player_4 = Player.create!(name: "sally", age:12 )
    @player_5 = Player.create!(name: "mary", age: 13)
    @player_6 = Player.create!(name: "barb", age: 12)
    @player_7 = Player.create!(name: "jon", age: 13)
    @player_8 = Player.create!(name: "jake", age: 12)
    @player_9 = Player.create!(name: "rhonda", age: 13)
    @player_10 = Player.create!(name: "beth", age: 12)
    @player_11 = Player.create!(name: "laurel", age: 13)

    @competition_1 << [@team_1, @team_2]

    @team_1 << [@player_1, @player_2, @player_3, @player_4, @player_5]
    @team_2 << [@player_6, @player_7, @player_8, @player_9, @player_10]

  end
  it 'I see the competitions name, location, and sport
    And I see the name and hometown of all teams in this competition
    And I see the average age of all players in the competition' do

    visit competition_path(@competition_1.id)
# save_and_open_page
    within("#competition-#{@competition_1.id}") do
      expect(page).to have_content(@competition_1.name)
      expect(page).to have_content(@competition_1.location)
      expect(page).to have_content(@competition_1.sport)
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_3.hometown)
      expect(page).to have_content(@team_4.hometown)
      expect(page).to have_content(@team_5.hometown)
      expect(page).to have_content(@team_6.hometown)
      expect(page).to have_content(@competition_1.avg_player_age)
    end
  end
end
