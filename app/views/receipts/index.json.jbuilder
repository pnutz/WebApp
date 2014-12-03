json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :total, :date, :transaction_number, :category_id, :subtotal, :folder_id, :profile_id, :note, :vendor_id, :currency_id, :tags
  json.receipt_items receipt.receipt_items do |item| 
    json.extract! item, :id, :item_type_id, :cost, :quantity
    json.tags item.tags
    json.item_name item.item_type.name
  end
  json.receipt_taxes receipt.receipt_taxes do |tax| 
    json.extract! tax, :id, :tax_type_id, :cost
    json.tax_name tax.tax_type.name
  end
  json.url receipt_url(receipt, format: :json)
end
