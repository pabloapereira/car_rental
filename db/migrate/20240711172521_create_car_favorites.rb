class CreateCarFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :car_favorites do |t|
      t.references :car, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
