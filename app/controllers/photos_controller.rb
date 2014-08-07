class PhotosController < ApplicationController
  def new
    @round = find_round
    @card = @round.card
    @photo = Photo.new
  end

  def create
    round = find_round
    round.photos.create(photo_params)

    redirect_to [:new, round, :guess]
  end

  private

  def find_round
    Round.find(params[:round_id])
  end

  def photo_params
    params.require(:photo).permit(
      :url,
    )
  end
end
