class Api::CepSupermarket < ActiveRecord::Base
    self.table_name = "cep_supermarkets"
    belongs_to :cep
    belongs_to :supermarket
end
