require "rails_helper"

describe CompTeam, type: :model do
   describe "relationships" do
      it {should belong_to(:team)}
      it {should belong_to(:competition)}
   end
end
