class AddColumns < ActiveRecord::Migration
  def change
  	add_column :amenities, :name, :string
  	add_column :amenities, :image_source, :string 	  	
  end
end
