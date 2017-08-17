#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'dotenv'
require 'twitter'

def get_password (eng)
  if eng == '-E'
	uri_str = '_en.php'
  else
	uri_str = '.php'
  end
  uri = URI.parse('http://hpmobile.jp/app/nekoatsume/neko_daily'+uri_str)

  response = Net::HTTP.get_response(uri)
  response.body.split(',')[1].force_encoding('UTF-8')
end

Dotenv.load
use_eng = ARGV[0]

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end


# Tweet the password if it's not a duplicate
password = get_password(use_eng)
latest_tweets = client.user_timeline(ENV['TWITTER_USER']).map(&:text)

client.update(password) unless latest_tweets.include?(password)