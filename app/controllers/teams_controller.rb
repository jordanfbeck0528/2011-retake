class TeamsController < ApplicationController
  def new
    @team = Team.new
    @competition = Competition.find(params[:competition_id])
  end

  # def create
  #   # team = Competition.find(params[:competition_id]).teams.new(team_params)
  #   require "pry"; binding.pry
  #   team = Competition.find(params[:competition_id]).teams.new(:hometown, :nickname)
  #   team.save
  #   @competition = Competition.find(params[:competition_id])
  #   # require "pry"; binding.pry
  #   redirect_to competition_path(params[:merchant_id])
  # end

  # and private
  #
  # def team_params
  #   params.permit(:hometown, :nickname)
  # end
end
