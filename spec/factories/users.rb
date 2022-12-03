FactoryBot.define do
  factory :user do
    name { "MyString" }
    credit { 1 }
    is_admin { false }
  end
end
