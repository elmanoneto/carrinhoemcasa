class Api::ProductSupermarket < ActiveRecord::Base
  belongs_to :product
  belongs_to :supermarket
end
