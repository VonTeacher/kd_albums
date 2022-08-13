FactoryBot.define do
  factory :user do
    email { Farker::Internet.email }
    password_digest { Faker::Internet.password }
  end
end
