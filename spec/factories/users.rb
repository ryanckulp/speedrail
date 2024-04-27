FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    paying_customer { false }
  end
end
