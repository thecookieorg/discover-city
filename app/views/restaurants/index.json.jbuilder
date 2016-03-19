json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :phone_number, :website, :order_online, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :facebook, :twitter, :instagram
  json.url restaurant_url(restaurant, format: :json)
end
