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

get '/' do
  content_type 'application/json', :charset => 'utf-8'
  headers['Cache-Control'] = 'public, max-age=21600' # Cache for six hours
  
  array = []
    
  Twitter.retweets_of_me.each do |retweet|
    # tid = retweet.id
    # users = []
    retweet
    # Twitter.retweeters_of(tid, :ids_only => true).each do |user|
    #   # uid = user.id
    #   # users << uid
    #   user.inspect
    # end
    
    # push items to array
    # array << {
    #   :tweet => tid,
    #   :retweeters => users
    # }
  end
  
  
  # # return first 5 items of array as json object
  # array.to_json

end