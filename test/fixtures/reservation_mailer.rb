require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "confirm" do
    email = ReservationMailer.confirm_booking(Reservation.first.user, Reservation.first.listing, Reservation.first)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['notmisokuan@gmail.com'], email.from
    assert_equal ['pui_kuan93@hotmail.com'], email.to
    assert_equal 'Reservation Confirmed', email.subject
    assert_equal read_fixture('confirm').join, email.body.to_s
  end
end
