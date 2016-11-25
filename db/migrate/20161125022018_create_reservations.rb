class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date
      t.decimal :total_cost, precision: 6, scale: 2
      t.string :special_request

      t.timestamps null: false
    end
  end
end
