class CreateApiSupermarkets < ActiveRecord::Migration
  def change
    create_table :api_supermarkets do |t|
      t.string :name
      t.string :description
      t.boolean :everyday
      t.string :image

      t.timestamps null: false
    end
  end
end
