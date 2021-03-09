class Competition < ApplicationRecord
  has_many :comp_teams
  has_many :teams, through: :comp_teams
  has_many :players, through: :teams

  def avg_player_age
    players.average(:age)
  end
end
