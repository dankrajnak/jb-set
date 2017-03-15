FactoryGirl.define do
  factory :question_answer do
    question
    survey_completion
    answer Faker::Lorem.sentence
  end
end
