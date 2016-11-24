module ApplicationHelper

	def allowed?(user_id, listing_id)
		if user_id == Listing.find(listing_id).user_id || User.find(user_id).admin?
			return true
		else
			return false
		end
	end

end
