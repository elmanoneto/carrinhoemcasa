json.array!(@api_ceps) do |api_cep|
  json.extract! api_cep, :id, :cep, :street, :neighborhood, :city, :state
  json.url api_cep_url(api_cep, format: :json)
end
