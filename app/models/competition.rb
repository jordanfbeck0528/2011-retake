class Competition < ApplicationRecord
  has_many :comp_teams
  has_many :teams, through: :comp_teams
end
