class AddCheckInDateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :check_in_date, :date
  end
end
