json.(@survey, :name)

# JSON format:
# lastFilledOut?: string = when this survey was last completed
# lastCountry?: string = the last country to fill this out
# countries: string [] = array of countries that have completed the survey
# questions: {name: string, id: number}[] = array of the questions this survey has

json.lastFilledOut time_ago_in_words(@lastCompletionTime.getlocal) + " ago" if @lastCompletionTime
json.lastCountry @lastCompletionCountry if @lastCompletionCountry

json.countries @countries
json.questions @survey.questions.order(:qorder), :name, :qtype, :id
