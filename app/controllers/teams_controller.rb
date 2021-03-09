class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    team = Competition.find(params[:competition_id]).teams.new(team_params)
    # require "pry"; binding.pry
    team.save
    redirect_to merchant_teams_path(params[:merchant_id])
  end

  def team_params
    params.permit(:hometown, :nickname)
  end
end
