module Jukeberx
  class Song
    attr_reader :id, :filename, :artist, :album, :title

    def initialize(id, file, tag)
      @pid = nil
      @id = id
      @filename = file
      @artist = tag.artist
      @album = tag.album
      @title = tag.title
    end

    def play
      @pid = spawn("afplay #{@filename}")
    end
  end
end
