class AddCompletedToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :completed, :boolean, default: false
  end
end
