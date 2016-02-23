class ChangeNumericFieldInProduct < ActiveRecord::Migration
  def change
    change_column :api_products, :price, :decimal, :precision => 8, :scale => 2
  end
end
