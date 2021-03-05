# Picky

Picky is a web app that allows you to find free items(pickies) that its users put on the curbside and posted in the app. It is built on Active Record and Sinatra libraries for its database and HTML requests.

## Installation

Download this repo. Open in your code editor. Run ```shotgun```. Then visit (http://localhost:9393/)


## Usage


### Sign Up

Sign up page contains a form that prompts user to enter a username, email and password.  
Username should be 4 to 8 word charaters (letter, number, underscore).    
Password should be 6 to 10 alphabetic and/or numeric characters.  

### Navigation Bar

**All Pickies** bar item displays a table of all the pickies that were posted by the app users.  
**Create Picky** bar item allows user to post a picky.  
**My Pickies** bar item displays a table of only user's pickies.  
**Log Out** bar item logs out and redirects to log in page.  

### Usernames

When any usernames is clicked, user will be navigated to selected user's pickies list.

### Pickies

When any picky is clicked, user will be navigated to selected pickies detail page which includes picky's name, location and user who posted.  
#### Post Picky
In order to post a picky, click to **Create Picky** from navigation bar and fill out the form. All empty boxes should be filled. Then clicked **Create**.
#### Edit/Delete Picky
A selected picky can be edited or deleted only by its user. For other users pickies edit and delete buttons won't be enabled.





