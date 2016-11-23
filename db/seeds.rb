# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
Listing.create(
	user_id: 1,
	name: FFaker::AddressAU.neighborhood,
	city: FFaker::AddressAU.city,
	address: FFaker::AddressAU.full_address,
	price: rand(10_000..100_000) * 0.01,
	max_occupancy: rand(1..6),
	number_of_rooms: rand(1..3),
	description: FFaker::Tweet.body,
	availability: true
	)
end

