class ReservationsController < ApplicationController

	def new
		@listings = Listing.find(params[:listing])
	end

	def create
	    params.permit!
	    reservation = Reservation.create(params[:reservation])
	    reservation.user_id = current_user.id
	    reservation.save
	    redirect_to("/listings/#{reservation.listing_id}")
  	end
end
