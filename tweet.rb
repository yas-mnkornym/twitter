#!/usr/bin/env ruby
WORK_DIR=File.expand_path(__FILE__).sub(/[^\/]+$/,'')
require WORK_DIR + 'Class/TetesolTwitter.rb'
#半角スペース対応
tweet_user = TetesolTwitter.new(WORK_DIR + 'Config/user.yml')

msg = ''
args = ARGV
args.each do | text |
  msg += text + ' '
end
if msg == '' or args.length == 0
  print 'input massage! : '
  msg = STDIN.gets
end
if msg.match(/ $/)
  msg[/ $/]= ''
end
begin
  tweet = tweet_user.tweet(msg)
  p tweet.id
  tweet_user.tweet_print_console(tweet)
rescue
  puts 'tweet error!'
  exit
end
