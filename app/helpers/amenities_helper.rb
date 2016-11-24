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

	def amenities_icon(id)
		amenities = Amenity.find_by(listing_id: id)
		list_of_amenities = []
		amenities.attributes.each do |attr|
			if attr[1] == true
				case attr[0]
				when "wifi"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/139/139906.svg\">&nbsp;"
				when "pool"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/262/262359.svg\">&nbsp;"
				when "gym"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/249/249187.svg\">&nbsp;"
				when "breakfast"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/262/262413.svg\">&nbsp;"
				when "spa"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/273/273280.svg\">&nbsp;"	
				when "aircond"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/262/262370.svg\">&nbsp;"	
				when "parking"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/262/262385.svg\">&nbsp;"
				when "kitchen"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/235/235834.svg\">&nbsp;"	
				when "tv"
				  list_of_amenities << "<img class=\"icon\" src=\"http://image.flaticon.com/icons/svg/262/262357.svg\">&nbsp;"
				end
			else
			end
		end
		return list_of_amenities.join(" ")
	end
end
