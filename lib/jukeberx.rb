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
    set :library, Searcher.new(MUSIC_DIR)
    set :playing, nil
    set :queue, []
    enable :logging

    get '/' do
      @songs = settings.library.match_artists(params['name'])
      erb :index
    end

    get '/artists' do
      content_type :json
      if params['name']
        name = params['name']
        settings.library.match_artists(name).to_json
      else
        settings.library.list_artists.compact.to_json
      end
    end

    get '/albums' do
      content_type :json
      if params['name']
        name = params['name']
        settings.library.match_albums(name).to_json
      else
        settings.library.list_albums.compact.to_json
      end
    end

    get '/titles' do
      content_type :json
      if params['name']
        name = params['name']
        settings.library.match_titles(name).to_json
      else
        settings.library.list_titles.compact.to_json
      end
    end

    post '/play/:id' do
      song = settings.library.find { |x| x.id == params['id'].to_i }
      song.play
      "'#{song.artist} - #{song.title}' is now playing!"
    end

    run! if app_file == $0
  end
end
