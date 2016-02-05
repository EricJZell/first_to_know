![Build Status](https://codeship.com/projects/e34e6f30-a608-0133-11fd-326223f7077d/status?branch=master)
![Code Climate](https://codeclimate.com/github/EricJZell/first_to_know.png)
![Coverage Status](https://coveralls.io/repos/EricJZell/first_to_know/badge.png)

[Visit First to Know!](https://first-to-know.herokuapp.com/)

# First to Know
First to Know is a web app where users can subscribe to recieve text message alerts the minute a selected twitter user tweets a certain phrase. For example, perhaps you want to be the first to know when Papa John's is giving away free pizza. You can create a subscription to Papa John's twitter account for the phrase 'free pizza'. The minute Papa John's tweets anything containing the string 'free pizza', a text message will be sent to the user's provided phone number.

## Technical Features
- Built with Ruby on Rails
- The 'twitter' gem is utilized for interfacing with the Twitter API
- The Twilio API is used for sending SMS Text Messages
- A rake task scans the Twitter API to see if any subscriptions have been tweeted
- A crontab job executes the rake task every minute
- Devise is used for user authentication
- Users must have a valid authorization token in order to register, which is to be provided by an administrator
