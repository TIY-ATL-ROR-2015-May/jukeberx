$LOAD_PATH.unshift(File.dirname(__FILE__))

require "json"
require "pry"
require "faker"
require "sinatra"

require "jukeberx/version"

module Jukeberx
  STATUSES = {
    'brit'     => 'feeling less sickly',
    'randy'    => 'excited about apps',
    'rickard'  => 'thumb twiddling',
    'philip'   => 'lost and scared',
    'kevin'    => 'Lost In New York',
    'sherri'   => 'reading docs, solving problems'
  }

  def status(username)
    STATUSES[username]
  end

  def random_status(username)
    new_status = Faker::Hacker.say_something_smart
    STATUSES[username] = new_status
  end
end

helpers Jukeberx

get '/status/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  username = params['name']
  {
    username: username,
    status: status(username)
  }.to_json
end

get '/random_status/:name' do
  random_status(params['name'])
  "Your status has been updated #{params['name']}!"
end

#get '/set_status/:name' do
#
#end
