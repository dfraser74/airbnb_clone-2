class ReservationsController < ApplicationController

	def new
		@listings = Listing.find(params[:listing])
	end

	def create
	    params.permit!
	    @reservation = Reservation.new(params[:reservation])
	    if @reservation.save
	      redirect_to("/reservations/#{@reservation.id}")
	  	else
	  	  flash[:notice] = $notice
	  	  redirect_to(:back)
	  	end
  	end

  	def show
  		@reservation = Reservation.find(params[:id])
  	end
end
