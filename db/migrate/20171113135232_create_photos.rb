class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :filelocation
      t.references :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end
