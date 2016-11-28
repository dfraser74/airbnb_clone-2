class ReservationMailer < ApplicationMailer

	def confirm_booking(user, listing, reservation)
		@user = user
		@listing = listing
		@reservation = reservation
		@url = 'http://localhost:3000/'
		mail(to: @user.email, subject: "Reservation Confirmed ; #{@listing.name}")
	end

end
