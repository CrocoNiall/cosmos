class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :votes

    mount_uploader :url, PlaceImageUploader
end


