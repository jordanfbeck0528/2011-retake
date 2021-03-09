class CompTeamsController < ApplicationController
  def create
    # team = Competition.find(params[:competition_id]).teams.new(team_params)
    # require "pry"; binding.pry
    # team = Competition.find(params[:competition_id]).teams.new(:hometown, :nickname)
    team = Competition.find(params[:competition_id])
    team.teams.new
    # require "pry"; binding.pry
    team.save
    @competition = Competition.find(params[:competition_id])
    # require "pry"; binding.pry
    redirect_to competition_path(params[:competition_id])
  end
end
