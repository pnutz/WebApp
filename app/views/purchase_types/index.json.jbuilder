json.array!(@purchase_types) do |purchase_type|
  json.extract! purchase_type, :name, :id
  json.url purchase_type_url(purchase_type, format: :json)
end
