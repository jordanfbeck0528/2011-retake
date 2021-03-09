require 'rails_helper'
RSpec.describe 'As a user, when I visit a competition show page', type: :feature do
  before :each do
    @competition_1 = Competition.create!(name: "Football Championship" , location: "Denver", sport: "football")

    @team_1 = Team.create!(hometown: "Aspen", nickname: "good team")
    @team_2 = Team.create!(hometown: "Boulder", nickname: "awesome team")
    @team_3 = Team.create!(hometown: "Denver", nickname: "really good team")

    @player_1 = @team_1.players.create!(name: "tom", age: 12)
    @player_2 = @team_1.players.create!(name: "jim", age: 12)
    @player_3 = @team_1.players.create!(name: "bill", age: 13)
    @player_4 = @team_1.players.create!(name: "sally", age:12 )
    @player_5 = @team_1.players.create!(name: "mary", age: 13)
    @player_6 = @team_2.players.create!(name: "barb", age: 12)
    @player_7 = @team_2.players.create!(name: "jon", age: 13)
    @player_8 = @team_2.players.create!(name: "jake", age: 12)
    @player_9 = @team_2.players.create!(name: "rhonda", age: 13)
    @player_10 = @team_2.players.create!(name: "beth", age: 12)

    @competition_1.teams << [@team_1, @team_2]

    # @team_1 << [@player_1, @player_2, @player_3, @player_4, @player_5]
    # @team_2 << [@player_6, @player_7, @player_8, @player_9, @player_10]

  end
  it 'I see the competitions name, location, and sport
    And I see the name and hometown of all teams in this competition
    And I see the average age of all players in the competition' do

    visit competition_path(@competition_1.id)

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)

    within("#team-#{@team_1.id}") do
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_1.nickname)
    end

    within("#team-#{@team_2.id}") do
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_2.nickname)
    end
    expect(page).to have_content(@competition_1.avg_player_age.round)
  end
  it 'I see a link to register a new team When I click this link
    Then I am taken to a new page where I see a form' do

    visit competition_path(@competition_1.id)

    expect(page).to have_link("Register Team")

    click_link("Register Team")

    expect(current_path).to eq(chef_ingredients_path(@chef_1))

    # within("#team-#{@team_1.id}") do
    #   expect(page).to have_content(@team_1.hometown)
    #   expect(page).to have_content(@team_1.nickname)
    # end
    #
    # within("#team-#{@team_2.id}") do
    #   expect(page).to have_content(@team_2.hometown)
    #   expect(page).to have_content(@team_2.nickname)
    # end
    # expect(page).to have_content(@competition_1.avg_player_age.round)
  end
end

# When I fill in this form with a team's hometown and nickname
# And I click submit
# Then I am redirected back to the competition's show page
# And I see the new team I created listed
