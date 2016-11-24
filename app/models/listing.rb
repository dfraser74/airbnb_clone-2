class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :amenities, dependent: :destroy
end