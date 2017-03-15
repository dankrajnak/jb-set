FactoryGirl.define do
  factory :question do
    name Faker::Lorem.sentence
    qtype ["mc", "tf", "lr", "yn"].shuffle.first
    survey
  end
end
