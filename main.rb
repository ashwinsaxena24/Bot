#! /usr/bin/ruby
require_relative 'bot'
fred = Bot.new(:name => 'Fred', :data_file => 'fred.bot')
#chris = Bot.new(:name => 'Chris', :data_file => 'fred.bot')
r = fred.greeting
puts(r)
while msg = gets.chomp
  r = fred.response_to(msg)
  puts(r)
end
r = fred.farewell
puts(r)
