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
def longResponse (name, required)
  question = Question.new
  question.name = name
  question.qtype = 'lr'
	question.required = required
	
  return question
end

def shortResponse (name, required)
  question = Question.new
  question.name = name
  question.qtype = 'sr'
	question.required = required
  return question
end

def multipleChoice (name, choices, required)
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
	question.required = required
  return question
end

def yesNo (name, required)
  question = Question.new
  question.name = name
  question.qtype = 'yn'
	question.required = required
  return question
end

def trueFalse (name, required)
  question = Question.new
  question.name = name
  question.qtype = 'tf'
	question.required = required
  return question
end

def number (name, required)
  question = Question.new
  question.name = name
  question.qtype = 'n'
	question.required = required
  return question
end

def header (name)
  question = Question.new
  question.name = name
  question.qtype = 'h'
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

  q = []

  # Make some questions
  q.push longResponse "Long Response Test", false
  q.push shortResponse "Short Response Test", false
  q.push header "Test Header"
  q.push yesNo "Test Yes No", false
  q.push number "Test Number", false
  q.push multipleChoice "Test Multiple Choice", %w(A B C D), false
  q.push trueFalse "Test True False", false

  # Attach and save the questions
  q.each_with_index do |question, i|
    question.qorder = i
	question.required = (i % 2 == 0)
    question.survey = testSurvey
    question.save
  end

end




Survey.find_by_name("National JB SET").destroy if Survey.find_by_name("National JB SET")
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

  neighborhoods = ['Andinos (AJB)', 'Anzac (APJB)', 'Cam (AJB)', 'Central Eastern (EJB)', 'JB North (AJB)',
  'JB South (AJB)', 'Mediterranean (EJB)', 'Northern (EJB)', 'Tea (APJB)', 'Whip It (APJB)', 'Wild West (EJB)', 'N/A']
  q.push multipleChoice "Select your JB Neighborhood", neighborhoods, true
  q.push number 'How many chapters do you have?', true
	q.push multipleChoice 'Which age group is most highly represented on the national level in your JB?', ['11-14', '15-18', '19-23', '23-25', 'It is very balanced'], true
	q.push multipleChoice 'The leadership of my National JB falls into one of the following categories:', ['NJRs only', 'NJRs and JB Board / Team', 'NJRs and JB Board / Team and Working groups', 'Other'], true
	q.push yesNo 'Are NJRs part of the National Board?', true
	q.push multipleChoice 'Are your NJRs elected or appointed?', ['Elected', 'Appointed'], true
	q.push yesNo 'Do you have role profiles or Terms of Reference/Book of Procedures for your NJRs?', true

  # Size and Capacity
  q.push header 'Size and Capacity'
  q.push number 'How many national JB events do you have per year?', true
  q.push number 'How many JBers, on average, are active participants in all local JBs in your country? (Give your best estimate).', true
  q.push number 'How many JBers, on average, are active participants on the national level in your JB?', true
  
	q.push number "What percentage of your JB has the gender \"Male\" (give your best estimate, not required if you wish not to answer).", false
	q.push number "What percentage of your JB has the gender \"Male\" (give your best estimate, not required if you wish not to answer).", false
	q.push number "What percentage of your JB has a gender that does not fall into the category Male or Female? (give your best estimate, not required if you wish not to answer).", false
	q.push longResponse "Other comments:", false
	

  # JB Relationship with NA, Neighborhood, Region, and IJB
  q.push header 'JB Relationship with NA, Neighborhood, Region, and IJB'
	q.push trueFalse "My JB is heard by my CISV NA/PA\'s board.", true
	q.push trueFalse "My CISV NA/PA's board support the projects and activities developed by my JB.", true
  q.push trueFalse 'My JB participates in projects with other JBs in my neighborhood.', true
  q.push trueFalse 'My JB participates in projects with other JBs in my region.', true
  q.push number 'How many JBers from you NA attended your most recent regional meeting?', true
	q.push number 'How many JBers from your NA attended IJBC 2016 in Colombia?', true
	q.push number 'How many JBers from your NA will attend IJBC 2017 in Portugal?', true
	q.push longResponse "What do you need from IJB that you aren\'t getting?", true
	
	q.push longResponse "What Regional Team of IJB Team initiatives did you use in your JB? (For example: Dig In, the IJB Bot, the EJB Blog, direct support from a member of a regional team).", true
		
	q.push longResponse "Other comments:", false
		


  # JB Training
	q.push header 'JB Training'
  q.push trueFalse "As NJRs, we feel that we received the appropriate training and support to function in our role.", true
	q.push multipleChoice "The majority of the useful training for our role we received from:", ['IJB', 'Our National JB', 'Regional Teams', 'NA Board', 'Other'], true
	q.push number "How many JBers were trained by the NJRs or another JBer with a national position?", true
	q.push yesNo "Did the NJRs received \"Train the Trainer\" training as part of their roles as NJRs?", true
	q.push yesNo "Do NJRs deliver training to other JBers", true
	q.push yesNo "Is your NA aware of the training you deliver?", true
	q.push longResponse "How do you measure the success of the training you deliver, and its impact?", false
	q.push longResponse "Other comments:", false
		
	# Best Practices
	q.push longResponse "What was the JB event you planned were most proud of? (2016-2017)", true
	q.push longResponse "What do you think is the purpose of JB?", true

  # Mosaic / Service Projects
  q.push header 'Mosaic / Service Projects'
	q.push multipleChoice 'How important are service/local impact/Mosaic projects to your National JB?', ["Not important at all.", "Talked about, but no chapter plan service proejcts/Mosaics.", "Somewhat important, some chapters do service projects/Mosaics.", "Very important.  Chapters frequently do service projects/Mosaics."], true
	q.push multipleChoice "Do you train your JBers on Mosaic?", ["Not at all.", "We emphasize local service, but don\'t train on how to make these projects into Mosaics.", "We train our JBers on Mosaic."], true
  q.push longResponse "Other comments:", false
		

  #Attach and save the questions
  q.each_with_index do |question, index|
    question.survey = nSet
    question.qorder = index
    question.save
  end

end