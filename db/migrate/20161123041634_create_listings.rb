class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.timestamps null: false
      t.string :name
      t.string :city
      t.string :address
      t.decimal :price
      t.boolean :availability
      t.integer :max_occupancy
      t.integer :number_of_rooms
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
