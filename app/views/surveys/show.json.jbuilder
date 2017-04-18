json.(@survey, :name)

json.lastFilledOut time_ago_in_words(@survey.survey_completions.last.created_at.getlocal) + " ago"

countries = Array.new
@survey.survey_completions.each {|c| countries.push(c.country)}

json.set! :completions do
  json.array! @survey.survey_completions do |c|
    json.country c.country
    json.questions do
      json.array! c.question_answers do |a|
        json.name a.question.name
        json.type a.question.qtype
        json.answer a.answer
      end
    end
  end
end


