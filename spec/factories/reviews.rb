FactoryBot.define do
  factory :review do
    user { nil }
    recipe { nil }
    text { "MyString" }
    grade { 1 }
  end
end
