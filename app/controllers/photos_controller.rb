class PhotosController < ApplicationController

  def new
      @title = 'Add a place to your cosmos'
      @photo = Photo.new
      if params[:place_id].present? 
        
        @place = Place.find(params[:place_id])
      else
        @place = Place.new

        
      end
          
  end

  def create

    photo = Photo.new(url: photo_params[:url], place_id: params[:place_id])

      if photo.save
        Vote.create(photo: photo, vote: true)
        flash[:notice] = 'photo created successfully!'
        redirect_to photo
      else
        flash.now[:error] = "Error: #{photo.errors.full_messages}"
        render :new_photo
      end
  end


  def show 
    @photo = Photo.find(params[:id])
    @place = Place.find(@photo.place_id)
    @votes = Vote.where(photo_id: @photo.id).count


  end


  def photo_params
    params.require(:photo).permit(:url, :place_id)
  end
end
