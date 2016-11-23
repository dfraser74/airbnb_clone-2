module AmenitiesHelper

	def available_amenities(id)
		amenities = Amenity.find_by(listing_id: id)
		list_of_amenities = []
		amenities.attributes.each do |attr|
			if attr[1] == true
				list_of_amenities << attr[0].capitalize
			elsif attr[1] == false
				list_of_amenities << "<s>" + attr[0].capitalize + "</s>"
			else
			end
		end
		return list_of_amenities.join(", ")
	end
end
