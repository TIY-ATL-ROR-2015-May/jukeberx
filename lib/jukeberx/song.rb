module Jukeberx
  class Song
    attr_reader :filename, :artist, :album, :title

    def initialize(file, tag)
      @filename = file
      @artist = tag.artist
      @album = tag.album
      @title = tag.title
    end
  end
end
