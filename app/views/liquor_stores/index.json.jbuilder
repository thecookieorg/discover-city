json.array!(@liquor_stores) do |liquor_store|
  json.extract! liquor_store, :id, :name, :address, :phone, :website, :hours_monday, :hours_tuesday, :hours_wednesday, :hours_thursday, :hours_friday, :hours_saturday, :hours_sunday, :delivery, :latitude, :longitude
  json.url liquor_store_url(liquor_store, format: :json)
end
