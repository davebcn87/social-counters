require 'sinatra'
require 'json'
require './twitter_count.rb'

get '/' do
  content_type :json
  twitterCount = TwitterCount.new()
  twitterDict = Hash.new
  twitterDict["followers_count"] = twitterCount.getCount()
  twitterDict["account"] = twitterCount.getAccounts()
  twitterDict.to_json
end
