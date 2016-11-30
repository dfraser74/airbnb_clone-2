class CreateJoinTableListingSearch < ActiveRecord::Migration
  def change
    create_join_table :listings, :searches do |t|
      t.index [:listing_id, :search_id]
      t.timestamps null: false
    end
  end
end
