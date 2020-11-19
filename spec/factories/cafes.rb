FactoryBot.define do
  factory :cafe do
    name { Faker::Food.dish }
    order { "coffee" }
    description { "冬に飲みたくなる、身体が温まる飲み物です" }
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

  trait :picture do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_cafe.jpg')) }
  end

  trait :ingredients do
    ingredients_attributes {
                             [
                               { name: "横浜" },
                               { name: "新宿" },
                               { name: "渋谷" },
                               { name: "海老名" },
                               { name: "平塚" },
                               { name: "大船" },
                               { name: "茅ヶ崎" },
                               { name: "原宿" },
                               { name: "下北沢" },
                               { name: "伊勢原" },
                             ]
    }
  end
end
