json.(@survey, :name)

json.lastFilledOut time_ago_in_words(@lastCompletionTime.getlocal) + " ago" if @lastCompletionTime
json.lastCountry @lastCompletionCountry if @lastCompletionCountry

if @survey.survey_completions.length > 0
  countries = Array.new
  @survey.survey_completions.each {|c| countries.push(c.country)}

  json.set! :completions do
    json.array! @survey.survey_completions do |c|
      surveyComplete = true
      json.country c.country
      json.questions do
        json.array! c.question_answers do |a|
          if a.answer.empty? || a.answer == "/No Answer/"
            surveyComplete = false
          else
            json.id a.question.id
            json.name a.question.name
            json.type a.question.qtype
            json.answer a.answer
          end
        end
      end
      json.completed surveyComplete
    end
  end
end


