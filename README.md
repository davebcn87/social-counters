social-counters
===============

Set of scripts to get a list/counter of followers and fans of a social group including several accounts of each social network. 


**************

INSTALL
-------
This ruby scripts require some gems to work. You can find below the instructions to install them depending your OS

### UBUNTU:

> *apt-get install ruby* 
 
> *gem install twitter*

> *gem install facebook*


***************

CONTENT
-------

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

 
 - twitter_counter.rb    # Code with twitter actions for count followers of several accouts


#### FACEBOOK

 - facebook_counter.rb   # Code with facebook actions for count followers of several accouts
