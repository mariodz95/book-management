json.extract! book, :id, :name, :author, :pages, :description, :languange, :publisher, :bookNumber, :created_at, :updated_at
json.url book_url(book, format: :json)
