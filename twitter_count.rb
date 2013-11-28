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
		#begin
			counter = 0
			@accounts.each do |username|
				counter = counter + TwitterClient.user(username).followers_count
			end
			counter
		#rescue
		#	-1
		#end
	end

	# Returns an specific List (listName) owned by an specific user (userName) 
	# It returns -1 when rate limit exceeded or bad authentication
	def getList(userName,listName)
		begin
	    	list = TwitterClient.owned_lists(userName)
	    	@selectedList=""
	    	list.each do |listTMP|
	    		if(listTMP.name==listName)
	    			@selectedList = listTMP
    			end
	    	end
	    	@selectedList
		rescue
			-1
		end
	end

	# Returns an array with the members IDs of the list selected with getList
	def getMembersList()
		begin
	    	@members=[];
	    	userMembers = TwitterClient.list_members(@selectedList)
	    	userMembers.each do |memberInList|
	    		@members << memberInList.id
	    	end
	    	@members
	    rescue
	    	-1
	    end
	end
	
	# Returns 0 if not added because already included
	# Returns 1 if added
	# Returns -1 if error
	def addUserToList(username)
		begin
			result = 0
			if !@members.include?(username)
				TwitterClient.add_list_member(@selectedList,username)
				result = 1
			end
			result
		rescue
			-1	
		end
	end


end
