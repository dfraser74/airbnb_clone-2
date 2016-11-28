class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(user, listing, reservation)
  	#byebug
  	@user = user
  	@listing = listing
  	@reservation = reservation
  	#@url = 'http://localhost:3000/'
	#mail(to: @user.email, subject: "Reservation Confirmed ; #{@listing.name}")
    ReservationMailer.confirm_booking(@user, @listing, @reservation).deliver
  end
end
