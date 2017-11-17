FactoryBot.define do
  factory :product_category do
    association :product, factory: :product
    association :category, factory: :category
  end
end
