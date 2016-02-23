class AddCategoryToProduct < ActiveRecord::Migration
  def change
    add_column :api_products, :category, :string
  end
end
