class Amenity < ActiveRecord::Base
  belongs_to :listing, dependent: :destroy
end
