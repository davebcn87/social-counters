#!/usr/bin/env ruby

require 'twitter'
require './twitter_auth'
require './GDrive'

class TwitterCount
	def initialize
		# Connect to Google Drive and get the list of Twitter accounts
		drive = GDrive.new
		drive.Login
		ws = drive.openSheet("0AjPDjdc9aoO8dGNDNDZMci1Na0NJVHMyc2RXMm1DN1E",0)
		@accounts = drive.readCol(ws,1,ws.num_rows)

		@accounts = @accounts.uniq 	#Removing duplicates
	end

	# Get twitter accounts
	def getAccounts()
		@accounts
	end

	# Count the followers by account and save a counter for the total
	# It returns -1 when rate limit exceeded
	def getCount()
		begin
			counter = 0
			@accounts.each do |username|
				counter = counter + Twitter.user(username).followers_count
			end
			counter
		rescue
			-1
		end
	end
end
