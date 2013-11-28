require 'sinatra'
require 'json'
require './twitter_count.rb'

get '/' do
  puts "Hello"
end

get '/twitter' do
  content_type :json
  twitterCount = TwitterCount.new()
  twitterDict = Hash.new
  twitterDict["followers_count"] = twitterCount.getCount()
  twitterDict["account"] = twitterCount.getAccounts()
  twitterDict["list"] = twitterCount.getList("bcntb", "Socios")
  twitterDict["listMembers"] = twitterCount.getMembersList()
  twitterDict["added"] = twitterCount.addUserToList(:user)
  twitterDict.to_json
end

get '/twitter/followers' do
	content_type :json
	twitterCount = TwitterCount.new()
	twitterDict = Hash.new
	twitterDict["followers_count"] = twitterCount.getCount()
	twitterDict["accounts"] = twitterCount.getAccounts()
	twitterDict.to_json
end	

get '/twitter/list' do
	content_type :json
	twitterCount = TwitterCount.new()
	twitterDict = Hash.new
	twitterDict["list"] = twitterCount.getList("bcntb", "Socios")
	twitterDict["listMembers"] = twitterCount.getMembersList()
	twitterDict.to_json
end

get '/twitter/list/add/:user' do
	content_type :json
	twitterCount = TwitterCount.new()
	twitterDict = Hash.new
	twitterDict["added"] = twitterCount.addUserToList(:user)
	twitterDict.to_json
end
