class Place < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  def high_img place
    top_image_count = 0
    top_photo = {}
    place.photos.each do |photo|
      # puts photo.votes.where(vote: true).count
      # puts photo[:url]
      if photo.votes.where(vote: true).count > top_image_count
        top_photo = photo
        top_image_count = photo.votes.where(vote: true).count

      end
    end
    # binding.pry
    top_photo


  end



end
