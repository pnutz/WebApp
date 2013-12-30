json.array!(@currencies) do |currency|
  json.extract! currency, :code, :description
  json.url currency_url(currency, format: :json)
end
