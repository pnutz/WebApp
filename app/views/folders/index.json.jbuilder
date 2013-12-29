json.array!(@folders) do |folder|
  json.extract! folder, :id, :name, :description, :user_id, :folder_type_id, :folder_id
  json.url folder_url(folder, format: :json)
end
