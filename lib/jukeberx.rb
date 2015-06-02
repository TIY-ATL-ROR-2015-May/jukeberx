require "pry"
require "json"
require "faker"
require "sinatra"

require 'jukeberx/version'
require 'jukeberx/searcher'

MUSIC_DIR = '/Users/brit/Music/downloads'

module Jukeberx
end

searcher = Jukeberx::Searcher.new(MUSIC_DIR)
searcher.get_mp3s
