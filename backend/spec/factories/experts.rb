FactoryBot.define do
  factory :expert do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TEST_PASS_#{n}"}
    sequence(:password_confirmation) { |n| "TEST_PASS_#{n}"}
    association :expert_type
  end
end
