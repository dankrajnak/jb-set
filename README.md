# Mixed Nuts Final Project
We are creating a standard evaluational tool for a a branch of an international nonprofit organization. The Junior Branch of CISV International, a peace education organization uses the JB SET (or standard evaluational tool) to measure the success of the organization every year.  There are two sets of questions, one for national associations, and one for local chapters.  

## Instructions

need to have postgreSQL installed then run:

rake db:create

rake db:migrate

bundle install

After that just "rails s" and go to localhost:3000


#Project Plan
Here is what a Local Junior Representative or National Junior Representative will need to do with our app:

* Create an account as a national association or a local chapter
* Fill out the questions which correspond to the national SET or local SET.  (We need to code this in a way that the questions will be able to easily change before this is officially published to the organization)
* Save (it would be great if this happens as soon as they enter it) and be able to change their answers if things change

Anyone viewing the site should be able to

* See realtime stats and cool graphs on the data.  I'm thinking we use d3.js.
* (possibly) see who has not filled out the SET.  If I can get an excel with all of the chapters, this shouldn't be too bad.

It would also be awesome to include some functionality on

* Emailing NJRs and LJRs who haven't filled out the SET as deadlines approach.
* Some sort of twitter bot that tweets cool updates every now and then (very optional).
* Comparative statistics.  You fill it out and you can see where you match up to the rest of the world.  This is functionality we could share with everyone—you pick a country or chapter to compare with the rest of the world.

Other things that need to be done:

* Site frontend.  
* Signup page
* User results page (to see their answers and change them)


So, I'm thinking that we each pick some of these to tackle and stay in close communication because these tasks are heavily reliant upon eachother.  **To call dibs, on one of these you need to:**

1. Post on groupme that you want something
2. Write your name next to it in the readme.
3. Be responsible for it. It's your thing now

Also, so we don't fall into a trap, remember **CALL BEFORE YOU CODE**.  And by that I mean, message the group with what you're intending to code before you do it so we don't waste time making things that won't fit together.

Ok.  Go team.  

