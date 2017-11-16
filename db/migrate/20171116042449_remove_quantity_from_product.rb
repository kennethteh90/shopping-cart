class RemoveQuantityFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :quantity
  end
end
