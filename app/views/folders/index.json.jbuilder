json.array!(@folders.sort_by { |folder| folder.name.downcase }) do |folder|
  json.extract! folder, :id, :name, :description, :user_id, :folder_type_id, :folder_id, :profile_id
  json.url folder_url(folder, format: :json)
end
