require "pry"
require "json"
require "mp3info"
require "sinatra/base"

require 'jukeberx/version'
require 'jukeberx/song'
require 'jukeberx/searcher'

MUSIC_DIR = '/Users/brit/Music/downloads'

module Jukeberx
  class App < Sinatra::Base
    set :library, Jukeberx::Searcher.new(MUSIC_DIR)
    enable :logging

    get '/' do
      "Do you know how to use the API? Try these routes!
            '/artists',
            '/albums',
            '/titles'"
    end

    get '/artists' do
      settings.library.list_artists.to_json
    end

    get '/albums' do
      settings.library.list_albums.to_json
    end

    get '/titles' do
      settings.library.list_titles.to_json
    end

    post '/play' do
      
    end

    run! if app_file == $0
  end
end

