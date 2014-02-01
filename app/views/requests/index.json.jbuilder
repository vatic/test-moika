json.array!(@requests) do |request|
  json.extract! request, :name, :phone, :email, :text, :references
  json.url request_url(request, format: :json)
end
