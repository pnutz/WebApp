json.array!(@addresses) do |address|
  json.extract! address, :street_address, :zipcode, :references
  json.url address_url(address, format: :json)
end
