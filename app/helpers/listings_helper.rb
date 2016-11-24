module ListingsHelper

	def setup_listing(listings)
    	listings.amenities ||= Amenity.new
    	listings
  	end

	def availability_checker(listing_id)

		if Listing.find(listing_id).availability == true
			return "Yes"
		else
			return "No"
		end
	end

	def edit_authorization(user_id, listing_id)

		case User.find(user_id).role
		when "landlord"
			return "<a href=\"/listings/#{listing_id}/edit\"><button type=\"input\">Edit</button></a>"
		else
			return ""
		end
	end	

	def delete_authorization(user_id, listing_id)

		case User.find(user_id).role
		when "landlord", "admin"
			return(
				link_to listing_path(listing_id), method: :delete do
					"<button>Delete</button>".html_safe 
				end
			)
		else
			return ""
		end
	end

	def image_gallery(listing_id)
		@listings = Listing.find(listing_id)
		i = 0
		code = []
		while i < @listings.avatars.length
			code << image_tag(@listings.avatars[i].url)
			i += 1
		end
		return code.join(" ")
	end

	def main_image(listing_id)
		@listings = Listing.find(listing_id)

		if @listings.avatars.length > 0
			image_tag(@listings.avatars[0].url)
		else
			image_tag('http://www.novelupdates.com/img/noimagefound.jpg')
		end
	end
end