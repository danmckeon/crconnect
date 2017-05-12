# CRConnect

## The Team

* [Dan McKeon](https://github.com/danmckeon)
* [Nick Jarin](https://github.com/njarin)
* [Phil Cornman](https://github.com/pjc5108)

## Description

Clinical trials have a participant satisfaction rate of more than 90%, yet less than 5% of cancer patients participate. Not enough patients (and doctors) know what trials are available to them. Patients need more options. Researchers need more participants. CRC connects these two groups by making information on clinical trials much easier to find. To do so, we scrape publicly available government filings for clinical trials and make them easily searchable for the average person. Our current application includes both lung and colorectal cancer trials, but we plan to extend to other types in the coming months.

## How to Install Locally

* Run the following commands in console to set up environment and database:
`bundle install`
`bundle exec rake db:create`
`bundle exec rake db:migrate`
`bundle exec rake db:seed`
* Run `rails s` in console to start server

## How to Use the App

* CRConnect is deployed at: https://crconnect.org/
* Use the search form at bottom of home page to find clinical trials matching a particular condition

## Disclaimer

This website is a prototype. It is intended to show information pertaining to clinical trials relevant to a particular condition. We have made our best effort in compiling this information but cannot guarantee the validity of any information found on this site. Users should always consult their doctor before acting on any information found on this website.
