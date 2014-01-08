json.array!(@currencies) do |currency|
  json.extract! currency, :code, :description, :id
  json.url currency_url(currency, format: :json)
end
