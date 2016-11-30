class AddListingToSearch < ActiveRecord::Migration
  def change
    add_reference :searches, :listing, index: true, foreign_key: true
  end
end
