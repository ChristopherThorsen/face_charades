class ResultsController < ApplicationController
  def show
    @round = Round.find(params[:round_id])
  end
end
