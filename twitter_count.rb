#!/usr/bin/env ruby

require 'twitter'
require './twitter_auth'

accounts = ["_cometeelmundo_", "equipatgedema"]

accounts.each do |username|
	puts "#{username}: #{Twitter.user(username).followers_count}"
end
