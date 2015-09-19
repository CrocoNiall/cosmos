class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @title = 'Add a place to your cosmos'
    @place = Place.new
  end

  def create
    coordinate = Geocoder.coordinates(place_params['name'])
    location = Geocoder.search(place_params['name'])
    @place_name = location.first.address_components[0].first[1]
    @lat = coordinate[0]
    @lng = coordinate[1]

    # @lat_lng = coordinate.reduce
    place = Place.new(name: @place_name, lat: @lat, long: @lng)
    
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

    @lat_lng = "lat: #{@place.lat}, lng: #{@place.long}"
    gon.location = [@place.lat, @place.long]
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
  def place_params
    params.require(:place).permit(:name)
  end

end

