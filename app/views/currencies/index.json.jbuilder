json.array!(@currencies) do |currency|
  if (current_user.user_setting.currency_id == currency.id)
    json.selected :true
  else
    json.selected :false
  end
  json.extract! currency, :code, :description, :symbol, :id
  json.url currency_url(currency, format: :json)
end
