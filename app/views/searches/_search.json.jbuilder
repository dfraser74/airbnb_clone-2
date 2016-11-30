json.extract! search, :id, :available, :low_price, :high_price, :city, :max_occupancy, :number_of_rooms, :created_at, :updated_at
json.url search_url(search, format: :json)