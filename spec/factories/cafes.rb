FactoryBot.define do
  factory :cafe do
    name { Faker::Food.cafe }
    order { Coffee }
    description { "冬に飲みたくなる、身体が温まる飲み物です" }
    reference { "https://cookpad.com/recipe/2798655" }
    popularity { 5 }
    association :user
    wifi { "あり" }
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
