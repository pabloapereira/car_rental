class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :cnpj
      t.integer :telephone_number
      t.string :adress

      t.timestamps
    end
  end
end
