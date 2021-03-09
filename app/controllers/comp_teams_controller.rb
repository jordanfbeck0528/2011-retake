class CompTeamsController < ApplicationController
  def create
    # team = Competition.find(params[:competition_id]).teams.new(team_params)
    # require "pry"; binding.pry
    # team = Competition.find(params[:competition_id]).teams.new(:hometown, :nickname)
    # team = Competition.find(params[:competition_id])
    # team.teams.new
    team = Team.new(hometown: params[:hometown], nickname: params[:nickname])
    team.save
    @competition = Competition.find(params[:competition_id])

    @competition.teams << team
    # require "pry"; binding.pry
    # if team.save
    #   # require "pry"; binding.pry
    #   redirect_to "/competitions/#{@competition.id}"
    # else
    #   render "new"
    # end
    # require "pry"; binding.pry
    # redirect_to competition_path(params[:competition_id])
    redirect_to competition_path(@competition)
  end
end
