class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_and_belongs_to_many :searches
  has_and_belongs_to_many :amenities
  accepts_nested_attributes_for :amenities, :allow_destroy => true
  mount_uploaders :avatars, AvatarUploader

  scope :available, -> { where(availability: true) }
  scope :low_price, ->(low_price) { where("price >= ?", low_price) }
  scope :high_price, ->(high_price) { where("price <= ?", high_price) }
  scope :city, ->(preferred_city) { where("city ILIKE ?", "%#{preferred_city}%") }
  scope :max_occupancy, ->(pax) { where("max_occupancy >= ?", pax) }
  scope :number_of_rooms, ->(rooms) { where("number_of_rooms >= ?", rooms) }
  # scope :amenities, ->(amenity) { joins(:amenities).where("amenity_id IN (?)", amenity.map(&:to_i)) }

  scope :has_amenity, -> (amenities) { joins(:amenities).where("amenities.id" => amenities)  }

# def self.check_list(amenities)

#     @confirm = []
#     Listing.all.each do |listings|
#       @listing = []
#       amenities.each do |amenity_id|
#         byebug
#         check = Listing.joins(:amenities).where(amenities_id: amenity_id).where(listing_id: listings.id)
#         if check.blank?
#         else
#           @listing << check
#         end 
#       end
#       if @listing.length == amenities.length
#         @confirm << @listing
#       end

#     end

#     return @confirm
#   end  
end
