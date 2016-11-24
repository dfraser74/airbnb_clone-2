module ListingsHelper

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
end