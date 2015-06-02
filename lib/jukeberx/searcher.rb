module Jukeberx
  class Searcher
    include Enumerable

    def initialize(dir)
      @songs = self.get_mp3s(dir)
    end

    def each
      @songs.each { |x| yield(x) }
    end

    def get_mp3s(dir)
      files = Dir.glob(File.join(dir, '*/*.mp3'))
      files.map do |mp3_file|
        tag = Mp3Info.open(mp3_file) { |mp3| mp3.tag }
        Song.new(mp3_file, tag)
      end
    end
  end
end
