class Product < ApplicationRecord
  include PgSearch
  
  has_many :product_categories, dependent: :destroy

  has_many :categories, through: :product_categories

  has_many :photos, dependent: :destroy

end
