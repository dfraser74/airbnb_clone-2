class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.boolean :available
      t.decimal :low_price
      t.decimal :high_price
      t.string :city
      t.integer :max_occupancy
      t.integer :number_of_rooms

      t.timestamps null: false
    end
  end
end
