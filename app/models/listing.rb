class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :amenities, dependent: :destroy
  accepts_nested_attributes_for :amenities, :allow_destroy => true
  mount_uploaders :avatars, AvatarUploader

  scope :available, -> { where(availability: true) }
  scope :low_price, ->(low_price) { where("price >= ?", low_price) }
  scope :high_price, ->(high_price) { where("price <= ?", high_price) }
  scope :city, ->(preferred_city) { where(city: preferred_city) }
  scope :max_occupancy, ->(pax) { where("max_occupancy >= ?", pax) }
  scope :number_of_rooms, ->(rooms) { where("number_of_rooms >= ?", rooms) }

end
