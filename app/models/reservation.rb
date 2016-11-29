class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  belongs_to :listing
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  before_validation :valid_date_order, on: :create
  before_validation :unique_check_in_and_out_dates, on: :create
  before_validation :date_availability, on: :create

  def valid_date_order
    if check_in_date != nil
      if check_in_date > check_out_date
        self.check_in_date = nil
        self.check_out_date = nil
        $notice = "Check in date cannot be later than check out date"
      end
    end
  end   

  def unique_check_in_and_out_dates
    if check_in_date != nil
  	if check_in_date == check_out_date
  		self.check_in_date = nil
  		self.check_out_date = nil
      $notice = "Check in and check out dates must be 1 day apart"
  	else
  	end
  end
  end
 
  def date_availability
    user_record = Reservation.where(user_id: user_id)
    listing_record = Reservation.where(listing_id: listing_id)
    if check_in_date != nil
      user_record.each do |x|
        if (x.check_in_date..x.check_out_date).include?(check_in_date) || (x.check_in_date..x.check_out_date).include?(check_out_date) || (check_in_date..check_out_date).include?(x.check_in_date) || (check_in_date..check_out_date).include?(x.check_out_date)
          self.check_in_date = nil
          self.check_out_date = nil
          $notice = "You've already have a reservation on those dates!"
          break
        else
        end
      end

      if check_in_date != nil
        listing_record.each do |x|
          if (x.check_in_date..x.check_out_date).include?(check_in_date) || (x.check_in_date..x.check_out_date).include?(check_out_date) || (check_in_date..check_out_date).include?(x.check_in_date) || (check_in_date..check_out_date).include?(x.check_out_date)
            self.check_in_date = nil
            self.check_out_date = nil
            $notice = "Listing already booked for those dates." 
            break
          else
          end
        break
        end
      end
    end

  end

end
