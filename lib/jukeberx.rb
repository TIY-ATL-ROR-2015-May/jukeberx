require "pry"
require "json"
require "mp3info"
require "sinatra"

require 'jukeberx/version'
require 'jukeberx/song'
require 'jukeberx/searcher'

MUSIC_DIR = '/Users/brit/Music/downloads'

module Jukeberx
end

searcher = Jukeberx::Searcher.new(MUSIC_DIR)
searcher.get_mp3s

binding.pry
