class PlacesController < ApplicationController
    def index
    @places = Place.all
  end

  def new
    @user = Place.new
  end

  def create
    place = Place.new(user_params)
    
    if place.save
      flash[:notice] = 'Place created successfully!'
      redirect_to place
    else
      flash.now[:error] = "Error: #{place.errors.full_messages}"
      render :place
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    place = Place.find(params[:id])

    if place.update(place_params)
      redirect_to place
    else
      render :edit
    end
  end

  def destroy
    place = Place.find(params[:id]).destroy

    redirect_to places
  end

  private
  def article_params
    params.require(:place).permit(:name, :long, :lat)
  end
end
