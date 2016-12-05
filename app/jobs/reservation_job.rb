class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(user, listing, reservation)
  	@user = user
  	@listing = listing
  	@reservation = reservation
    ReservationMailer.confirm_booking(@user, @listing, @reservation).deliver
  end
  
end
