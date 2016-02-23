class CreateApiCeps < ActiveRecord::Migration
  def change
    create_table :api_ceps do |t|
      t.string :cep
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
