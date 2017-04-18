json.name @question.name
json.type @question.qtype
json.surveyId @question.survey.id
json.surveyName @question.survey.name


json.set! :answers do
  json.array! @question.question_answers do |a|
    json.country a.survey_completion.country
    json.answer a.answer
  end
end
