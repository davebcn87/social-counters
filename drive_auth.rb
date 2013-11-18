require 'oauth2'
require 'google_drive'

class DriveLogin
	def getSession
		return GoogleDrive.login("user@gmail.com", "password")
	end
end
