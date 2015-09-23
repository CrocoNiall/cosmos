class PlacesController < ApplicationController

  def index
    @places = Place.all

  end

  def new
    @title = 'Add a place to The Cosmos'
    @place = Place.new
    @places = Place.all

  end

  def create
    coordinate = Geocoder.coordinates(place_params['name'])
    location = Geocoder.search(place_params['name'])
    @place_name = location.first.address_components[0].first[1]
    @lat = coordinate[0]
    @lng = coordinate[1]

    place = Place.new(name: @place_name, lat: @lat, long: @lng)
    
    if place.save
      flash[:notice] = 'Place created successfully!'
      redirect_to place
    else
      flash.now[:error] = "Error: #{place.errors.full_messages}"
      render :new_place
    end
  end

  def show
    @place = Place.find(params[:id])
    @searchObj = Geocoder.search(@place.name)
    @country = @searchObj.first.address_components.last.first[1]
    gon.location = [@place.lat, @place.long]

    @photos = @place.photos

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

  def map
    @places = Place.all
    # @searchObj = Geocoder.search(@place.name)
    # @country = @searchObj.first.address_components.last.first[1]
    # gon.location = [@place.lat, @place.long]

    locations = []
    @places.each do |place| 
      top_pic = place.high_img(place)
      place_details = [place.lat, place.long, place.name, top_pic.url_url, place.id]
      locations << place_details

    end
    gon.location_data = locations
   

  end


  private
  def place_params
    params.require(:place).permit(:name)
  end

end

