class CreateLiquorStores < ActiveRecord::Migration
  def change
    create_table :liquor_stores do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :hours_monday
      t.string :hours_tuesday
      t.string :hours_wednesday
      t.string :hours_thursday
      t.string :hours_friday
      t.string :hours_saturday
      t.string :hours_sunday
      t.string :delivery
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
