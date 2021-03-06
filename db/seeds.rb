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
if Rails.env.development?
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
end




#Survey.find_by_name("National JB SET 2017").destroy if Survey.find_by_name("National JB SET 2017")
unless Survey.find_by_name("National JB SET 2017")
  nSet = Survey.new
  nSet.name = "National JB SET 2017"
  nSet.about =
      "Welcome to the National JB SET! All the questions you’ll find on this survey are for National JBs to be filled by the NJRs " +
      "(if you are a NJR, feel free to discuss it with other JBers that are involved on the national level of your "+
      "Junior Branch). It will take about 25 minutes to answer.  This survey is best filled out at a board meeting.  " +
      "Sometimes the best result of the survey is discussion amongst your national board.  "+ "Although you can submit and save your answers at anytime, you need to fill out quesitons marked *Required in order for your survey to be marked as complete.  As long as you submit your survey, even if your survey is not complete, your answers will be used in the graphs on the front page, and will be available for download.  If you do not wish to answer a multiple choice question, please select the \"(Leave Blank)\" option.  Feel free to save your answers and come back to finish the survey later!  Thank you for taking the time to be a part of the JB SET this year!"
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
  q.push number 'How many JBers are active participants in all local JBs combined in your country? (Give your best estimate).', true
  q.push number 'How many JBers are active participants on the national level in your JB?', true
  
	q.push number "What percentage of your JB has the gender \"Male\" (give your best estimate, not required if you wish not to answer).", false
	q.push number "What percentage of your JB has the gender \"Female\" (give your best estimate, not required if you wish not to answer).", false
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
	
	q.push longResponse "What Regional Team or IJB Team initiatives did you use in your JB? (For example: Dig In, the IJB Bot, the EJB Blog, direct support from a member of a regional team).", true
		
	q.push longResponse "Other comments:", false
		


  # JB Training
	q.push header 'JB Training'
  q.push trueFalse "As NJRs, we feel that we have received the appropriate training and support to function in our role.", true
	q.push multipleChoice "The majority of the useful training for our role we received from:", ['IJB', 'Our National JB', 'Regional Teams', 'NA Board', 'Other'], true
	q.push number "How many JBers were trained by the NJRs or another JBer with a national position?", true
	q.push yesNo "Do NJRs received \"Train the Trainer\" training as part of their roles as NJRs?", true
	q.push yesNo "Do NJRs deliver training to other JBers", true
	q.push yesNo "Is your NA aware of the training you deliver?", true
	q.push longResponse "How do you measure the success of the training you deliver, and its impact?", false
	q.push longResponse "Other comments:", false
		
	# Best Practices
	q.push header 'Best Practices'
	q.push longResponse "What was the JB event you planned were most proud of? (2016-2017)", true
	q.push longResponse "What do you think is the purpose of JB?", true

  # Mosaic / Service Projects
  q.push header 'Mosaic / Service Projects'
	q.push multipleChoice 'How important are service/local impact/Mosaic projects to your National JB?', ["Not important at all.", "Talked about, but no chapter planned local impact projects/Mosaics.", "Somewhat important, some chapters do local impact projects/Mosaics.", "Very important.  Chapters frequently do local impact projects/Mosaics."], true
	q.push multipleChoice "Do you train your JBers on Mosaic?", ["Not at all.", "We emphasize local service, but don\'t train on how to make these projects into Mosaics.", "We train our JBers on Mosaic."], true
  q.push longResponse "Other comments:", false
		

  #Attach and save the questions
  q.each_with_index do |question, index|
    question.survey = nSet
    question.qorder = index
    question.save
	end
		
end
	
#Survey.find_by_name("Local JB SET 2017").destroy if Survey.find_by_name("Local JB SET 2017")
unless Survey.find_by_name("Local JB SET 2017")
  lSet = Survey.new
  lSet.name = "Local JB SET 2017"
  lSet.about =
      "Welcome to the Local JB SET! All the questions you’ll find on this survey are for Local JBs to be filled by the LJRs " +
      "(if you are a LJR, feel free to discuss it with other JBers that are involved in your "+
      "Junior Branch). It will take about 25 minutes to answer.  This survey is best filled out at a board meeting.  " +
      "Sometimes the best result of the survey is discussion amongst your local board.  " + "Although you can submit and save your answers at anytime, you need to fill out quesitons marked *Required in order for your survey to be marked as complete.  As long as you submit your survey, even if your survey is not complete, your answers will be used in the graphs on the front page, and will be available for download.  If you do not wish to answer a multiple choice question, please select the \"(Leave Blank)\" option. Feel free to save your answers and come back to finish the survey later!  Thank you for taking the time to be a part of the JB SET this year!"
  lSet.national = false
  lSet.local = true
  lSet.save

  # Make the questions
  q = []
	
	# Background Question
	q.push header "Background Information"
	q.push multipleChoice 'Which age group is most highly represented on the national level in your JB?', ['11-14', '15-18', '19-23', '23-25', 'It is very balanced'], true
	q.push number "How many JBers do you have in leadership positions in your chapter?", true
	q.push multipleChoice "Our JB leadership falls into the following category:", ["Only LJRs", 'LRs and JB Board / Local JB Team', 'Other'], true
	
	# Size and Capacity
	q.push header "Size and Capacity"
	q.push number "How many JB events did you have this past year (roughly since June 2016) that you felt were successful?", true
	q.push number "How many JB events did you have this past year (roughly since June 2016) that you felt were unsuccessful?", true
	q.push number "How many JBers are active participants in your JB?", true
	q.push number "How many new members did your JB add this year?", true
	
	q.push number "What percentage of your JB has the gender \"Male\" (give your best estimate, not required if you wish not to answer).", false
	q.push number "What percentage of your JB has the gender \"Female\" (give your best estimate, not required if you wish not to answer).", false
	q.push number "What percentage of your JB has a gender that does not fall into the category Male or Female? (give your best estimate, not required if you wish not to answer).", false
	q.push longResponse "Other comments:", false
		
	# JB Relationship with NA, Neighborhood, Region, and IJB
	q.push header "JB Relationship with NA, Neighborhood, Region, and IJB"
	q.push yesNo "Do you know how your National JB is organized?", true
	q.push yesNo "Do you know how Internatinal JB is organized?", true
	q.push yesNo "Are you aware of neighborhood/regional meetings?", true
	q.push number "How many Jbers from your local JB have attended your most recent neighborhood workshop?", true
	q.push number "How many Jbers from your local JB attended your region's most recent annual meeting? (AJBM, EJBM, or JASPARC).", true
	q.push number "How many JBers from your local JB will attend the next IJBC (International Junior Branch Conference) in Colombia?", true
	q.push number "How many JBers will attend the IJBC 2017 in Portugal?", true
	q.push trueFalse "My local JB participates in neighborhood/regional/international projects or projects with other JBs", true
	q.push longResponse "Other comments:", false
		
	# JB Relationship with the Chapter
	q.push header "JB Relationship with the Chapter"
	q.push trueFalse "My JB always collaborates with my Chapter in matters of planning", true
	q.push trueFalse "My JB always collaborates with my Chapter in matters of facilitation of activities", true
	q.push trueFalse "My JB always collaborates with my Chapter in matters of programmes (camps, Mosaics, or IPPs)", true
	q.push trueFalse "The chapter plays an important part in the running of the JB", true
	q.push longResponse "Other comments:", false
		
	# Activities, Planning, and Evaluation
	q.push header "Activities, Planning, and Evaluation"
	q.push shortResponse "Which activity had the largest attendance?", true
	q.push number "How many people attended?", true
	q.push shortResponse "Which activity had the lowest attendance?", true
	q.push number "How many people attended?", true
	q.push trueFalse "My JB evaluates itself regularly (your JB in general, not activities) not including the JB SET", true
	q.push trueFalse "My JB evaluates its JB activities regularly", true
	q.push longResponse "How do you do it? (optional)", false
	q.push trueFalse "My JB plans and runs good and consistent activities", true
	q.push trueFalse "My JB has a good and consistent communication strategy", true
	q.push longResponse "Other comments:", false
	
	# JB Development
	q.push header "JB Development"
	q.push trueFalse "Most of the activities, projects, and events planned and run by my JB are aligned with CISV’s  four content areas (Human Rights, Diversity, Sustainable Development, and Conflict & Resolution).", true
	q.push trueFalse "I feel that JBers in my chapter are aware of the JB Goals.", true
	q.push shortResponse "Write three words to describe what you feel makes JB activities succesful", true
	q.push longResponse "What is the event that you planned that you were most proud of this year?", true
	q.push longResponse "What do you believe is the purpose of JB?", true
		
	# Training
	q.push header "Training"
	q.push yesNo "Does your local chapter (not your JB) provide training to your JBers?", true
	q.push yesNo "Do you benefit from training at the national level?", true
	q.push longResponse "What do you wish you received more training on?", true
	q.push longResponse "Other comments", false
	
	# Mosaic/Service/Local Impact
	q.push header "Mosaic / Service / Local Impact"
	q.push number "How many local impact activities did you organize this year?", true
	q.push number "How many participants were there? (add all the activities up, or write 0 if you did not have any local impact activities).", false
	q.push longResponse "Please list any like-minded organizations that your JB has worked with.", false
	q.push yesNo "Is Mosaic/Local Impact a priority to your JB?", true
	q.push longResponse "Other comments?", false
	
	 #Attach and save the questions
  q.each_with_index do |question, index|
    question.survey = lSet
    question.qorder = index
    question.save
	end
	
	#Push on beginning question
	question = shortResponse "What is your chapter?", true
	question.survey = lSet
	questions.qorder = -1
	question.save
	
	# Clean up old questions
	Question.all.each do |q|
		if q.survey.nil?
			q.destroy
		end
	end

		
end