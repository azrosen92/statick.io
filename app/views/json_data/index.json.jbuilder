json.array!(@json_data) do |json_datum|
  json.extract! json_datum, :id, :endpoint, :data, :last_accessed
  json.url json_datum_url(json_datum, format: :json)
end
