FactoryBot.define do
  sequence(:user_emails) { |n| "email#{n}@gmail" }

  factory :user do
    email { generate(:user_emails) }
    name { "name" }
    password { 123456 }
    credit { 1 }
    is_admin { false }
    trait :admin do
      is_admin { true }
    end
  end
end
