class ReservationsController < ApplicationController

	def new
		@listings = Listing.find(params[:listing])
	end

	def create
	    params.permit!
	    @reservation = Reservation.new(params[:reservation])
	    @reservation.check_in_date = Date.strptime(params[:reservation][:check_in_date], '%m/%d/%Y')
	    @reservation.check_out_date = Date.strptime(params[:reservation][:check_out_date], '%m/%d/%Y')
	    if @reservation.save
	      ReservationMailer.confirm_booking(@reservation.user, @reservation.listing, @reservation).deliver_later
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
