module Jukeberx
  class Searcher
    include Enumerable

    def initialize(dir)
      @songs = []
      self.get_mp3s(dir)
    end

    def each
      @songs.each { |x| yield(x) }
    end

    def get_mp3s(dir)
      files = Dir.glob(File.join(dir, '*/*.mp3'))
      files.each_with_index do |mp3_file, id|
        begin
          tag = Mp3Info.open(mp3_file) { |mp3| mp3.tag }
          @songs << Song.new(id, mp3_file, tag)
        rescue Mp3InfoError => e
          puts "#{mp3_file} failed with: #{e.message}"
        end
      end
    end
  end
end
