social-counters
===============

Set of scripts to get a list/counter of followers and fans of a social group including several accounts of each social network. 


**************

INSTALL
-------
This ruby scripts require some gems to work. You can find below the instructions to install them depending your OS

### UBUNTU:

	~$ apt-get install ruby
 	
	~$ bundle install

***************

CONTENT
-------

#### GOOGLE DRIVE

 - GDrive.rb             # Class with all the necessary methods to access to Google Drive and read/write files
 - drive_auth.rb         # Contains access tokens / user and password to login (this file is not included because contains private information)

```ruby
require 'google_drive'

class DriveLogin
  def getSession
      return GoogleDrive.login("mail@gmail.com","password")
  end
end
```


#### TWITTER
 
 - twitter_auth.rb       # Contains access tokens (this file is not included because contains private information)
 
```ruby
client = Twitter.configure do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end
```


Now this is working with environment variables. You must execute this command or add it to your bash profile before executing the application:

	export TWITTER_CONSUMER_KEY=4444444 // Replace numbers for your keys
	export TWITTER_CONSUMER_SECRET=122222 // Replace numbers for your keys
	export TWITTER_OAUTH_TOKEN=23123123 // Replace numbers for your keys
	export TWITTER_OAUTH_TOKEN_SECRET=1111 // Replace numbers for your keys
 
 - twitter_counter.rb    # Code with twitter actions for count followers of several accouts


#### FACEBOOK

 - facebook_counter.rb   # Code with facebook actions for count followers of several accouts


# Sinatra Server

For executing Sinatra server locally you must run this command:

	bundle exec rackup -p 9292 config.ru

