class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :reservations, :total_cost, :ind_cost
  	rename_column :reservations, :check_in_date, :booked_date
  end
end
