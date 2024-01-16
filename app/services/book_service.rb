class BookService
  def conn
    Faraday.new(url: "https://openlibrary.org/search.json?")
  end
 
 
  def find_books(location, quantity)
    response = conn.get do |req|
      req.params['place'] = location
      req.params['quantity'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end