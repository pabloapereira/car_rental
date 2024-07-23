class CreateCarUser < ActiveRecord::Migration[7.1]
  def change
    create_table :car_users do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
