require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require 'twitter'
require 'json'

Twitter.configure do |config|
  config.consumer_key = 'CYh0q3PYcX40PpNbL5cMZg'
  config.consumer_secret = 'NlWgp6z0ThhhszIxo9nVfvXRgGLzYyrachsaxVP0N8'
  config.oauth_token = '552273-colAELRDRFyaYxqHdKbeLvgTi0Bqt6m4aMjHV0zk'
  config.oauth_token_secret = 'joH5WooRUTZJoUJ2QZTbtC5hPC7JWoBMAcsWY2Z8A'
end

Twitter.user

get '/' do
  content_type 'application/json', :charset => 'utf-8'
  headers['Cache-Control'] = 'public, max-age=21600' # Cache for six hours
  
  client = Twitter::Client.new

  array = []
  
  client.retweets_of_me(:count => 10).each do |retweet|
    users = []
    client.retweeters_of(retweet.id).each do |user|
      users << {
        :id => user.id,
        :username => user.screen_name
      }
    end
    
    # push items to array
    array << {
      :id => retweet.id,
      :text => retweet.text,
      :retweeters => users
    }
  end
  
  # return first 5 items of array as json object
  array.to_json

end