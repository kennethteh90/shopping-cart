FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category#{n+=1}" }

    trait :invalid do
      name nil
    end
  end
end
