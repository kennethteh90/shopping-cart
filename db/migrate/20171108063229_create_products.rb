class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.text :description, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :quantity, null: false
      t.string :size
      t.string :color

      t.timestamps
    end
  end
end
