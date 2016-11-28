# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
	def confirm_booking
		ReservationMailer.confirm_booking(Reservation.last.user, Reservation.last.listing, Reservation.last)
	end
end
