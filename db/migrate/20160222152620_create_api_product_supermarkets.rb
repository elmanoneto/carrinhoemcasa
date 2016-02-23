class CreateApiProductSupermarkets < ActiveRecord::Migration
  def change
    create_table :api_product_supermarkets do |t|
      t.integer :product_id
      t.integer :supermarket_id

      t.timestamps null: false
    end
  end
end
