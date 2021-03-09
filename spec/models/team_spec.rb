require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it { should have_many :comp_teams }
    it { should have_many(:competitions).through(:comp_teams) }
  end
end
