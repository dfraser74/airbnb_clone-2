class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :amenities, dependent: :destroy

 accepts_nested_attributes_for :amenities,
 :allow_destroy => true

  mount_uploaders :avatars, AvatarUploader
end
