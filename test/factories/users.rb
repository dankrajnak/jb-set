FactoryGirl.define do
  factory :user do
    first_name  Faker::Name.first_name
    last_name  Faker::Name.last_name
    username  Faker::Name.first_name
    password  "something"
    position  Faker::Name.title
    email Faker::Internet.email
  end
end
