FactoryBot.define do
  factory :ingredient do
    name { "横浜" }
    association :cafe
  end
end
