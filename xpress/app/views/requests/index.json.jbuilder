json.array!(@requests) do |request|
  json.extract! request, :request_status, :user_id, :book_id
  json.url request_url(request, format: :json)
end
