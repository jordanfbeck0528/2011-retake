require "rails_helper"

describe Competition, type: :model do
  describe "relationships" do
    it {should have_many(:comp_teams)}
    it {should have_many(:teams).through(:comp_teams)}
    it {should have_many(:players).through(:teams)}
  end
  describe "instance methods" do
    it 'gives average age for all players in a competition' do

    end
  end
end
