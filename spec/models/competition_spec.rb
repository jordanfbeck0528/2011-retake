require "rails_helper"

describe Competition, type: :model do
  describe "relationships" do
    it {should have_many(:comp_teams)}
    it {should have_many(:teams).through(:comp_teams)}
  end
end
