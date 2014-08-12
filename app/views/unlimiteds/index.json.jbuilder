json.array!(@unlimiteds) do |unlimited|
  json.extract! unlimited, :id
  json.url unlimited_url(unlimited, format: :json)
end
