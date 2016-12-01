class ReservationsController < ApplicationController

	def new
		@listings = Listing.find(params[:listing])
	end

	def create
	    params.permit!

	    @reservation = Reservation.new(params[:reservation])
		@reservation.check_in_date = Date.strptime(params[:reservation][:check_in_date], '%m/%d/%Y')
		@reservation.check_out_date = Date.strptime(params[:reservation][:check_out_date], '%m/%d/%Y')
		@reservation.booked_date = Date.strptime(params[:reservation][:check_in_date], '%m/%d/%Y')
		@reservation.save

	    if @reservation.save

	      continue_check = true
	      #ReservationJob.perform_later(@reservation.user, @reservation.listing, @reservation)
	      (@reservation.check_in_date..@reservation.check_out_date).each do |date|
	      	if date != @reservation.check_in_date && continue_check == true
	      		@new_reservation = Reservation.new(params[:reservation])
	      		@new_reservation.booked_date = date
				@new_reservation.check_in_date = Date.strptime(params[:reservation][:check_in_date], '%m/%d/%Y')
				@new_reservation.check_out_date = Date.strptime(params[:reservation][:check_out_date], '%m/%d/%Y')
				#byebug
				if @new_reservation.save
				else
				   remove = Reservation.where(check_in_date: @reservation.check_in_date, user_id: @reservation.user_id)
				   remove.each do |x|
				   	x.destroy
				   end
	  	  		   continue_check = false
				   break
				end 
			end
		   end

		   if continue_check == true
		  	ReservationMailer.confirm_booking(@reservation.user, @reservation.listing, @reservation).deliver
	      	redirect_to("/reservations/#{@reservation.id}") 

	      	else
	      	flash[:notice] = $notice
	  	  	redirect_to(:back)

	       end		

	  	else
	  	  flash[:notice] = $notice
	  	  redirect_to(:back)
	  	end
  	end

  	def show
  		@main_reservation = Reservation.find(params[:id])
  		@reservation = Reservation.where(check_in_date: @main_reservation.check_in_date, user_id: @main_reservation.user_id)
  	end
end
