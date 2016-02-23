class Api::Product < ActiveRecord::Base
  self.table_name = "api_products"
  has_many :product_supermarket
  has_many :supermarket, through: :product_supermarket
end
