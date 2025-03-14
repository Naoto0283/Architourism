FactoryBot.define do
  factory :user do
    name { "Test" }
    sequence(:email) { |n| "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
