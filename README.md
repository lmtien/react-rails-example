# React Rails Example
The demo page is using `react-rails` to interact with web-server which is base on RoRs. The page support user to import database from a csv file, and the data can be processed in the background.

In the Gemfile, you can find a gem called `delay_job` which is help to do create other threading and process data asynchronous. And the result will be shown on the page immediately after creating data.   

### Usage

After downloading, then execute:

    $ bundle

Create database and initial data for the page:

    $ rake db:create db:migrate

To run the server:

    $ foreman start

React's components are located in `app\assets\components\`

### Test
All tests can be run with:

    $ rspec
