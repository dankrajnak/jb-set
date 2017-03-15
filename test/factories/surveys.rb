FactoryGirl.define do
  factory :survey do
    name Faker::App.name
    country Faker::Name.last_name
    bool = ((0..1).to_a.shuffle().first == 0)
    national bool
    local !bool
  end
end
