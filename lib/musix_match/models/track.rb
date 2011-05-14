module MusixMatch
  module Models
    class Track
      include Model
      include Searcher
      
      model_with_attributes :track_id, :track_mbid, :track_name, :track_mbid, :track_length, :lyrics_id, :instrumental, :subtitle_id,
                            :artist_id, :artist_mbid, :artist_name, :artist_mbid,
                            :album_name, :album_id, :album_coverart_100x100                        
      
      def self.get_chart(options={})        
        API::TrackChart.get_chart(options)
      end
    end
  end
end