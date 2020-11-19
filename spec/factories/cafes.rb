FactoryBot.define do
  factory :cafe do
    name { Faker::Food.dish }
    order { "coffee" }
    description { "冬に食べたくなる、身体が温まる料理です" }
    reference { "https://cookpad.com/recipe/2798655" }
    popularity { 5 }
    association :user
    created_at { Time.current }
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end
end
