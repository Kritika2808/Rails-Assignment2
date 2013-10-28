json.array!(@books) do |book|
  json.extract! book, :book_title, :author_name, :no_of_pages, :book_type
  json.url book_url(book, format: :json)
end
