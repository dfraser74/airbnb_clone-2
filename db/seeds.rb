# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Listing.all.each do |list|

Amenity.create(
	listing_id: list.id,
	wifi: [true, false].sample,
	pool: [true, false].sample,
	gym: [true, false].sample,
	breakfast: [true, false].sample,
	spa: [true, false].sample,
	aircond: [true, false].sample,
	parking: [true, false].sample,
	kitchen: [true, false].sample,
	tv: [true, false].sample
	)
end

