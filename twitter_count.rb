#!/usr/bin/env ruby

require 'twitter'
require './twitter_auth'
require './GDrive'

# Connect to Google Drive and get the list of Twitter accounts
drive = GDrive.new
drive.Login
ws = drive.openSheet("0AjPDjdc9aoO8dGNDNDZMci1Na0NJVHMyc2RXMm1DN1E",0)
accounts = drive.readCol(ws,1,ws.num_rows)

counter=0			#Initialize counter to 0
accounts = accounts.uniq 	#Removing duplicates

# Count the followers by account and save a counter for the total
accounts.each do |username|
	puts "#{username}: #{Twitter.user(username).followers_count}"
	counter+=Twitter.user(username).followers_count
end

puts "Total followers #{counter}"
