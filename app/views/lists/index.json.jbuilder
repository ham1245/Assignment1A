json.array!(@lists) do |list|
  json.extract! list, :id, :category
  json.url list_url(list, format: :json)
end
