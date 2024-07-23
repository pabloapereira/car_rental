class RemoveIsLeasedFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :is_leased, :boolean
  end
end
