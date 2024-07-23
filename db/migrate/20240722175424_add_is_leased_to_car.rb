class AddIsLeasedToCar < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :is_leased, :boolean
  end
end
