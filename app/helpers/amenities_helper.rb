module AmenitiesHelper

	def available_amenities(id)
		list_of_amenities = []
		Listing.find(id).amenities.each do |amenities|
			if amenities != nil	
				list_of_amenities << "<img class=\"icon\" src=\"#{amenities.image_source}\">&nbsp;"
			end
		end
		return list_of_amenities.join(" ").html_safe
	end

end
