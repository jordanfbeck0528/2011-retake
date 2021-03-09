class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @average_player_age = @competition.avg_player_age
  end

  # def new
  #
  # end
end
