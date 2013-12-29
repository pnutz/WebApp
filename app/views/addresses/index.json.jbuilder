json.array!(@addresses) do |address|
  json.extract! address, :street_address, :zipcode
  json.url address_url(address, format: :json)
end
