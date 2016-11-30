class RemoveListingFromSearch < ActiveRecord::Migration
  def change
    remove_reference :searches, :listing, index: true, foreign_key: true
  end
end
