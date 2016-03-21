class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :name
      t.text :description
      t.string :price_per_night
      t.string :free_wi_fi
      t.string :air_conditioned
      t.string :breakfast
      t.string :child_friendly
      t.string :airport_shuttle
      t.string :gym
      t.string :parking
      t.string :laundry_service
      t.string :pool
      t.string :restaurant
      t.string :hot_tub
      t.string :smoke_free
      t.string :accessible
      t.string :pets_allowed
      t.string :spa
      t.string :bar
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
