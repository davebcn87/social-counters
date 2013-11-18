require 'oauth2'
require 'google_drive'

class DriveLogin
	def getSession
		return GoogleDrive.login("aitor.anvi@gmail.com", "######")
	end
end
