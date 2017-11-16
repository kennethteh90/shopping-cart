class Product < ApplicationRecord

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :photos, dependent: :destroy

  has_many :orders
  has_many :users, through: :orders

  validates :name, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
