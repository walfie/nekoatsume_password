# nekoatsume_password
A simple script that tweets the [daily nekoatsume password](http://hpmobile.jp/app/nekoatsume/neko_daily.php).

[@nekoatsume_pass](https://twitter.com/nekoatsume_pass) is a bot that runs this script on an hourly basis -- following it and enabling notifications will
make it easy to copy/paste the password when it arrives.

## Setup
* Copy `.env.example` to `.env` and edit it to include Twitter credentials
* Run `bundle install` to install dependencies

## Usage
Run `./nekoatsume_pass.rb` to fetch and tweet the daily password.
