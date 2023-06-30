FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password { '123456' }
    role { :user }
  end
end
