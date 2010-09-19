module MusixMatch  
  module API
    class Search < Base  
      def search_lyrics(options={})
        response = get('lyrics.search', options)
        LyricsSearchResult.new(response)
      end

      def search_track(options={})
        response = get('track.search', options)
        TrackSearchResult.new(response)
      end

      def self.search_lyrics(options={})
        Search.new.search_lyrics(options)
      end

      def self.search_track(options={})
        Search.new.search_track(options)
      end
    end
  end
end