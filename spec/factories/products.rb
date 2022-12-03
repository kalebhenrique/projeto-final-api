FactoryBot.define do
  sequence :product_names do |n|
    "Product #{n}"
  end

  factory :product do
    name { generate(:product_names) }
    description { "MyString" }
    price { 1 }
    inventory { 1 }
    brand { association :brand }
    category { association :category }
  end
end
