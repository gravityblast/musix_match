module MusixMatch
  module Models
    class Track
      include Model
      
      model_with_attributes :track_id, :track_mbid, :lyrics_id, :track_name, :artist_id, :artist_mbid, :artist_name
    end
  end
end