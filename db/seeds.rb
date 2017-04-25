# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Question Types:
#  'lr'   Long Response
#  'sr'   Short Response
#  'mc'   Multiple Choice (Format: Question Name [CHOICES] Choice 1 | Choice 2 | Choice 3...)
#  'yn'   Yes/No
#  'tf'   True/False
#  'n'    Number
#  'h'    Header

#Question Methods
def longResponse (name, qorder, survey, save)
  question = Question.new
  question.name = name
  question.qtype = 'lr'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

def shortResponse (name, qorder, survey, save)
  question = Question.new
  question.name = name
  question.qtype = 'sr'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

def multipleChoice (name, choices, qorder, survey, save)
  question = Question.new
  nameWithChoice = name
  if choices
    nameWithChoice += "[CHOICES]"
    choices.each do |c, i|
      nameWithChoice+= " "+c
      nameWithChoice += " |" unless i == choices.length-1
    end
  end
  question.name = nameWithChoice
  question.qtype = 'mc'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

def yesNo (name, qorder, survey, save)
  question = Question.new
  question.name = name
  question.qtype = 'yn'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

def trueFalse (name, qorder, survey, save)
  question = Question.new
  question.name = name
  question.qtype = 'tf'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

def number (name, qorder, survey, save)
  question = Question.new
  question.name = name
  question.qtype = 'n'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

def header (name, qorder, survey, save)
  question = Question.new
  question.name = name
  question.qtype = 'h'
  question.qorder = qorder if qorder
  question.survey = survey if survey
  question.save if save
  return question
end

# Create Surveys
Survey.find_by_name("Test Survey").destroy if Survey.find_by_name("Test Survey")
unless Survey.find_by_name("Test Survey")
  testSurvey = Survey.new
  testSurvey.name = "Test Survey"
  testSurvey.about = "Just a test survey to test that all the different qtypes and submissions are working."
  testSurvey.national = true
  testSurvey.save

  #Attatch some questions
  longResponse "Long Response Test", 0, testSurvey, true
  shortResponse "Short Response Test", 1, testSurvey, true
  header "Test Header", 2, testSurvey, true
  yesNo "Test Yes No", 3, testSurvey, true
  number "Test Number", 4, testSurvey, true
  multipleChoice "Test Multiple Choice", %w(A B C D), 5,testSurvey, true
  trueFalse "Test True False", 6, testSurvey, true
end