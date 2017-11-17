FactoryBot.define do
  factory :order do
    sequence(:product_id) { |n| n += 1 }
    sequence(:user_id) { |n| n += 5 }
  end
end
