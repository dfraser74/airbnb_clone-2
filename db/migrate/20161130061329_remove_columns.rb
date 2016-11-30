class RemoveColumns < ActiveRecord::Migration
  def self.up
  	remove_column :amenities, :wifi
  	remove_column :amenities, :pool 	
  	remove_column :amenities, :gym
  	remove_column :amenities, :breakfast
  	remove_column :amenities, :spa  
  	remove_column :amenities, :aircond
  	remove_column :amenities, :parking
  	remove_column :amenities, :kitchen
  	remove_column :amenities, :tv
  	remove_column :amenities, :listing_id  			
  end

  def self.down
  	add_column :amenities, :wifi, :boolean
  	add_column :amenities, :pool, :boolean 	
  	add_column :amenities, :gym, :boolean
  	add_column :amenities, :breakfast, :boolean
  	add_column :amenities, :spa, :boolean  
  	add_column :amenities, :aircond, :boolean
  	add_column :amenities, :parking, :boolean
  	add_column :amenities, :kitchen, :boolean
  	add_column :amenities, :tv, :boolean
  	add_column :amenities, :listing_id, :references  			
  end  
end
