# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Listing.all.each do |list|
# 	Amenity.create(
# 		listing_id: list.id,
# 		wifi: [true, false].sample,
# 		pool: [true, false].sample,
# 		gym: [true, false].sample,
# 		breakfast: [true, false].sample,
# 		spa: [true, false].sample,
# 		aircond: [true, false].sample,
# 		parking: [true, false].sample,
# 		kitchen: [true, false].sample,
# 		tv: [true, false].sample
# 		)
# end

# User.create(
# 	email: "tenant@abc.com",
# 	password: "1234Qwer",
# 	first_name: "Tenant",
# 	role: 0)

# User.create(
# 	email: "landlord@abc.com",
# 	password: "1234Qwer",
# 	first_name: "Landlord",
# 	role: 1)

# User.create(
# 	email: "admin@abc.com",
# 	password: "1234Qwer",
# 	first_name: "Admin",
# 	role: 2)

# file = "~/Desktop/git_clones/airbnb_clone/app/assets/images/noimagefound.jpg"
# data_file = File.open(File.expand_path(file))
# Listing.all.each do |list|
# 	list.avatars = data_file
# 	list.save
# end

# namelist = ["pool","wifi","gym","breakfast","spa","aircond","parking","kitchen","tv"]

# imageurl = [
# 	"http://image.flaticon.com/icons/svg/139/139906.svg",
# 	"http://image.flaticon.com/icons/svg/262/262359.svg",
# 	"http://image.flaticon.com/icons/svg/249/249187.svg",
# 	"http://image.flaticon.com/icons/svg/262/262413.svg",
# 	"http://image.flaticon.com/icons/svg/273/273280.svg",
# 	"http://image.flaticon.com/icons/svg/262/262370.svg",
# 	"http://image.flaticon.com/icons/svg/262/262385.svg",
# 	"http://image.flaticon.com/icons/svg/235/235834.svg",
# 	"http://image.flaticon.com/icons/svg/262/262357.svg"]

# 9.times do
# 	Amenity.create(
# 		name: namelist.shift,
# 		image_source: imageurl.shift)
# end

# Listing.all.each do |listing|
# 	random = rand(1..9)
# 	(101..100+random).each do |x|
# 		@amenity = Amenity.find(x)
# 		listing.amenities << @amenity
# 	end
# end

# Listing.all.each do |x|
# 	x.amenities_group = []
# 	x.amenities_group << x.amenity_ids
# 	x.amenities_group.flatten
# 	x.save
# end