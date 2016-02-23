class Api::Cep < ActiveRecord::Base
  has_many :cep_supermarket
  has_many :supermarket, through: :cep_supermarket
end
