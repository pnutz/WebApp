json.array!(@folder_types) do |folder_type|
  json.extract! folder_type, 
  json.url folder_type_url(folder_type, format: :json)
end
