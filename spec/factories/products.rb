FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyString" }
    price { 1 }
    inventory { 1 }
    brand { nil }
    category { nil }
  end
end
