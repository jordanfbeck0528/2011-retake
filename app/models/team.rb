class Team < ApplicationRecord
  has_many :players
  has_many :comp_teams
  has_many :competitions, through: :comp_teams
end
