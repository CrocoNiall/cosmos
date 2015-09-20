class PhotosController < ApplicationController

def new
    @title = 'Add a place to your cosmos'
    @photo = Photo.new
end

def create
   photo = Photo.new(photo_params)
    
    if photo.save
      flash[:notice] = 'photo created successfully!'
      redirect_to photo
    else
      flash.now[:error] = "Error: #{photo.errors.full_messages}"
      render :new_photo
    end
end


def show 
  @photo = Photo.find(params[:id])

end

def photo_params
  params.require(:photo).permit(:url)
end
end
