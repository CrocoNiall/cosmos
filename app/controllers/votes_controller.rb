class VotesController < ApplicationController
  def new
    @vote = 'Add a place to your cosmos'
    @place = Place.new

  end

  def create

    vote = Vote.create(photo_id: params[:photo_id], vote: params[:vote])
    redirect_to "/places/#{Photo.find(params[:photo_id]).place_id}"
  end

  private
  def vote_params
    params.require(:vote).permit(:photo_id, :vote)
  end
end