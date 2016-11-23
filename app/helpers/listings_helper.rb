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
		when "admin", "tenant"
			return "You cannot edit this listing."
		end
	end	

	def delete_authorization(user_id, listing_id)

		case User.find(user_id).role
		when "landlord", "admin"
			return link_to "Delete", "/listings/#{listing_id}", :method => :delete
			# return(
			# 	link_to Listing.find(listing_id), method: :delete do
			# 		"<button>Delete</button>".html_safe 
			# 	end
			# )
		when "tenant"
			return "You cannot edit this listing."
		end
	end				
end