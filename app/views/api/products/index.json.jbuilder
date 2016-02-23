json.array!(@api_products) do |api_product|
  json.extract! api_product, :id, :name, :price, :image
  json.url api_product_url(api_product, format: :json)
end
