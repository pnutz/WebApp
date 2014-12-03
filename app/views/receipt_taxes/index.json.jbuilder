json.array!(@receipt_taxes) do |receipt_tax|
  json.extract! receipt_tax, :receipt_id, :item_type_id, :cost
  json.url receipt_tax_url(receipt_tax, format: :json)
end
