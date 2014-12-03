json.array!(@receipt_items) do |receipt_item|
  json.extract! receipt_item, :receipt_id, :item_type_id, :cost, :quantity
  json.url receipt_item_url(receipt_item, format: :json)
end
