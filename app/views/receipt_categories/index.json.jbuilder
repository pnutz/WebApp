json.array!(@receipt_categories) do |receipt_category|
  json.extract! receipt_category, :category, :id
  json.url receipt_category_url(receipt_category, format: :json)
end
