json.array!(@documents) do |document|
  json.extract! document, :is_snapshot, :receipt_id
  json.url document_url(document, format: :json)
end
