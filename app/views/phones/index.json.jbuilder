json.array!(@phones) do |phone|
  json.extract! phone, :id, :name, :phone_number
  json.url phone_url(phone, format: :json)
end
