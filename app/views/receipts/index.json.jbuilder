json.array!(@receipts) do |receipt|
  json.extract! receipt, :total, :transaction_number, :purchase_type_id, :title, :folder_id, :note, :vendor_id, :currency_id
  json.url receipt_url(receipt, format: :json)
end
