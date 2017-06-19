json.name @question.name
json.type @question.qtype
json.survey @question.survey, :id, :name
json.keys @keys, :id, :name unless @keys.empty?

json.set! :answers do
  json.array! @question.question_answers.each do |a|
		unless a.answer.blank?
			#Keys are identifiers of a survey outside of country. 
			keyAnswers = Array.new
			unless @keys.empty?
				@keys.each do |k|
					a.survey_completion.question_answers.any? do |qa|
						if qa.question.id == k.id && !qa.answer.blank?
							keyAnswers.push qa.answer
							true
						else
							false
						end					
					end
				end
			end
			if keyAnswers.length == @keys.length 
    		json.country a.survey_completion.country
    		json.answer a.answer
				json.keyAnswers keyAnswers unless keyAnswers.empty?
			end
		end
  end
end
