class Product < ApplicationRecord

  has_many :product_categories, dependent: :destroy

  has_many :categories, through: :product_categories

  has_many :photos, dependent: :destroy

    def cart_action(current_user_id)
      if $redis.sismember "cart#{current_user_id}", id
        "Remove from"
      else
        "Add to"
      end
    end

end
