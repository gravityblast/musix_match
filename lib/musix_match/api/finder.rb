module MusixMatch  
  module API
    class Finder < Base
      def find_lyrics(track_id)
        response = get('track.lyrics.get', {:track_id => track_id})
        LyricsFindResult.new(response)
      end

      def find_track(track_id)
        response = get('track.get', {:track_id => track_id})        
        TrackFindResult.new(response)
      end

      def self.find_lyrics(track_id)
        Finder.new.find_lyrics(track_id)
      end

      def self.find_track(track_id)
        Finder.new.find_track(track_id)
      end
    end
  end
end