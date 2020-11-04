FactoryBot.define do
  factory :favorite do
    association :cafe
    association :user
  end
end
