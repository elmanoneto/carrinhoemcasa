class CreateCepSupermarkets < ActiveRecord::Migration
  def change
    create_table :cep_supermarkets do |t|
      t.integer :cep_id
      t.integer :supermarket_id

      t.timestamps null: false
    end
  end
end
