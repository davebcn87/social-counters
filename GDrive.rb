require 'rubygems'
require 'google_drive'
require './drive_auth'

class GDrive
	#Vars
	@session
	
	#Login
	def Login
		@session = DriveLogin.new.getSession
	end
	
	#Open worksheet specifying key and sheet page number
	def openSheet(sheet_key, page=0)  
		ws = @session.spreadsheet_by_key(sheet_key).worksheets[page]
	end
	
	#Read column
	def readCol(working_sheet,col_num,num_rows)
		tmp = []
		for row in 1..num_rows
			tmp << working_sheet[row,col_num]
		end	
		return tmp	
	end
end

