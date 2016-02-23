class Api::Supermarket < ActiveRecord::Base
    has_many :cep_supermarket
    has_many :cep, through: :cep_supermarket
    has_many :product_supermarket
    has_many :product, through: :product_supermarket
end
