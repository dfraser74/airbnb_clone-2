module ListingsHelper

	def availability_checker(id)

		if Listing.find(id).availability == true
			return "Yes"
		else
			return "No"
		end
	end
end
