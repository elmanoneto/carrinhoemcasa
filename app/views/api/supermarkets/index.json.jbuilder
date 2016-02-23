json.array!(@api_supermarkets) do |api_supermarket|
  json.extract! api_supermarket, :id, :name, :description, :everyday, :image
  json.url api_supermarket_url(api_supermarket, format: :json)
end
