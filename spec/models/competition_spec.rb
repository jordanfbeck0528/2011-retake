require "rails_helper"

describe Competition, type: :model do
  describe "relationships" do
    it {should have_many(:comp_teams)}
    it {should have_many(:teams).through(:comp_teams)}
    it {should have_many(:players).through(:teams)}
  end
  describe "instance methods" do
    it 'gives average age for all players in a competition' do
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

      expect(@competition_1.avg_player_age.round).to eq(12)
    end
  end
end
