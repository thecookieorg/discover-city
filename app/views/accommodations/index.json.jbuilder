json.array!(@accommodations) do |accommodation|
  json.extract! accommodation, :id, :name, :description, :price_per_night, :free_wi_fi, :air_conditioned, :breakfast, :child_friendly, :airport_shuttle, :gym, :parking, :laundry_service, :pool, :restaurant, :hot_tub, :smoke_free, :accessible, :pets_allowed, :spa, :bar, :latitude, :longitude
  json.url accommodation_url(accommodation, format: :json)
end
