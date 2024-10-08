class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.integer :year
      t.string :plate
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
