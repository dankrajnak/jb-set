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

# Question-creation Methods
def longResponse (name)
  question = Question.new
  question.name = name
  question.qtype = 'lr'
  return question
end

def shortResponse (name)
  question = Question.new
  question.name = name
  question.qtype = 'sr'
  return question
end

def multipleChoice (name, choices)
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
  return question
end

def yesNo (name)
  question = Question.new
  question.name = name
  question.qtype = 'yn'
  return question
end

def trueFalse (name)
  question = Question.new
  question.name = name
  question.qtype = 'tf'
  return question
end

def number (name)
  question = Question.new
  question.name = name
  question.qtype = 'n'
  return question
end

def header (name)
  question = Question.new
  question.name = name
  question.qtype = 'h'
  return question
end



# Create Surveys
# Survey.find_by_name("Test Survey").destroy if Survey.find_by_name("Test Survey")
unless Survey.find_by_name("Test Survey")
  testSurvey = Survey.new
  testSurvey.name = "Test Survey"
  testSurvey.about = "Just a test survey to test that all the different qtypes and submissions are working."
  testSurvey.national = true
  testSurvey.save

  q = []

  # Make some questions
  q.push longResponse "Long Response Test"
  q.push shortResponse "Short Response Test"
  q.push header "Test Header"
  q.push yesNo "Test Yes No"
  q.push number "Test Number"
  q.push multipleChoice "Test Multiple Choice", %w(A B C D)
  q.push trueFalse "Test True False"

  # Attach and save the questions
  q.each_with_index do |question, i|
    question.qorder = i
    question.survey = testSurvey
    question.save
  end

end




# Survey.find_by_name("National JB SET").destroy if Survey.find_by_name("National JB SET")
unless Survey.find_by_name("National JB SET")
  nSet = Survey.new
  nSet.name = "National JB SET"
  nSet.about =
      "This document contains all the questions you’ll find on the survey for National JBs to be filled by the NJRs " +
      "(if you are a NJR, feel free to discuss it with other JBers that are involved on the national level of your "+
      "Junior Branch). It will take about 25 minutes to answer.  This survey is best filled out at a board meeting.  " +
      "Sometimes the best result of the survey is discussion amongst your national board."
  nSet.national = true
  nSet.local = false
  nSet.save

  # Make the questions
  q = []

  # Background Information
  q.push header 'Background Information'
  q.push multipleChoice "Select your JB Region", ["Americas' JB", "Europe, Middle East and Africa JB", "Asia Pacific JB"]

  neighborhoods = ['Andinos (AJB)', 'Anzac (APJB)', 'Cam (AJB)', 'Central Eastern (EJB)', 'JB North (AJB)',
  'JB South (AJB)', 'Mediterranean (EJB)', 'Northern (EJB)', 'Tea (APJB)', 'Whip It (APJB)', 'Wild West (EJB)', 'N/A']
  q.push multipleChoice "Select your JB Neighborhood", neighborhoods
  q.push number 'How many chapters do you have?'
  q.push longResponse 'Please describe the leadership/composition of your National JB Board, if you have one'

  # Size and Capacity
  q.push header 'Size and Capacity'
  q.push number 'How many national JB events do you have per year?'
  q.push number 'How many JBers, on average, are active participants in your JB?'
  q.push number 'How many JBers, on average, are active participants in your national JB?'
  q.push multipleChoice 'Would you say your National JB is composed of more:', ['Male', 'Female', 'Balanced ratio of genders']
  q.push number 'How many JB events did you plan and hold from ? to ?'

  # JB Relationship with NA, Neighborhood, Region, and IJB
  q.push header 'JB Relationship with NA, Neighborhood, Region, and IJB'

  q.push trueFalse"The relationship between my JB and my CISV NA/PA's board is good"
  q.push trueFalse 'My JB participates in neighborhood projects'
  q.push number 'How many JBers from your NA have attended your most recent neighborhood workshop?'
  q.push trueFalse 'How many JBers from you NA attended your most recent regional meeting?'


  # JB Development TODO These questions suck
  q.push trueFalse 'As NJRs, we constantly communicate with the LJRs'
  q.push longResponse 'What are the most effective methods of communication you use to keep in touch with the LJRs?'

  # Risk Management
  q.push header 'Risk Management'
  q.push yesNo 'Do you know who your National Risk Manager is?'
  q.push trueFalse 'Our national Risk Manager is aware of all of the activities organized by the JB.'

  # JB SET



  #Attach and save the questions
  q.each_with_index do |question, index|
    question.survey = nSet
    question.qorder = index
    question.save
  end

end