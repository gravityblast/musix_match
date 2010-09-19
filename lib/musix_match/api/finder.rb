module MusixMatch  
  module API
    class Finder < Base
      def find_lyrics(lyrics_id)
        response = get('lyrics.get', {:lyrics_id => lyrics_id})
        LyricsFindResult.new(response)
      end

      def find_track(track_id)
        response = get('track.get', {:track_id => track_id})
        TrackFindResult.new(response)
      end

      def self.find_lyrics(lyrics_id)
        Finder.new.find_lyrics(lyrics_id)
      end

      def self.find_track(track_id)
        Finder.new.find_track(track_id)
      end
    end
  end
end