class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.boolean :wifi
      t.boolean :pool
      t.boolean :gym
      t.boolean :breakfast
      t.boolean :spa
      t.boolean :aircond
      t.boolean :parking
      t.boolean :kitchen
      t.boolean :tv
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
