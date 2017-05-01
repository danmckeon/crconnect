# CRConnect

## The Team
* [Dan McKeon](https://github.com/danmckeon)
* [Nick Jarin](https://github.com/njarin)
* [Phil Cornman](https://github.com/pjc5108)

## Description
CRConnect is short for Cancer Research Connect. Our mission is to connect patients with research and provide information on clinical trials for anyone diagnosed with cancer. For this initial sprint, we are focusing on lung cancer in particular since it affects so many people. To do this, we scrape the publicly available government filings for clinical trials, but make them searchable in a way that makes sense for the average person.

## How to Install Locally
* Run the following commands in console to set up environment and database:
`bundle install`
`bundle exec rake db:create`
`bundle exec rake db:migrate`
`bundle exec rake db:seed`
* Run `rails s` in console to start server

## How to Use the App

* CRConnect is deployed at: https://crconnect.herokuapp.com/
* Use the search form at bottom of home page to find clinical trials matching a particular condition

## Disclaimer
This website is a prototype. It is intended to show information pertaining to clinical trials relevant to a particular condition. We have made our best effort in compiling this information but cannot guarantee the validity of any information found on this site. Users should always consult their doctor before acting on any information found on this website.
