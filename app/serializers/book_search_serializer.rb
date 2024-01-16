class BookSearchSerializer
  def initialize(location, forecast, books_data, quantity)
    @location = location
    @forecast = forecast
    @books_data = books_data
    @quantity = quantity
  end

  def serialized_json
    {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: @location,
          forecast: {
            summary: @forecast[:summary],
            temperature: @forecast[:temperature]
          }
        }
      }
    }
  end

  private

  def format_books(books, quantity)
    books.first(quantity).map do |book|

    end
  end
end
