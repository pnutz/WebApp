json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :total, :date, :transaction_number, :purchase_type_id, :title, :folder_id, :note, :vendor_id, :currency_id
  json.receipt_items receipt.receipt_items do |item| 
    json.extract! item, :id, :item_type_id, :cost, :quantity, :is_credit
    json.tags item.tags
    json.item_name item.item_type.name
  end
  json.url receipt_url(receipt, format: :json)
end
