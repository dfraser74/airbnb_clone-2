class AddAmenitiesToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :amenities, :string, array: true, default: '{}'
  end
end
