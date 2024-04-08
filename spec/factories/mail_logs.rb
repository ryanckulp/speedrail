FactoryBot.define do
  factory :mail_log do
    to { Faker::Internet.email }
    subject { Faker::Company.bs }
    body { Faker::Lorem.paragraph }
  end
end
