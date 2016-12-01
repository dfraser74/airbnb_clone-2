class AddAmenitiesGroupToListing < ActiveRecord::Migration
  def change
    add_column :listings, :amenities_group, :string, array: true, default: '{}'
  end
end
