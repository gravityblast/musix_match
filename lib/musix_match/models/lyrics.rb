module MusixMatch
  module Models
    class Lyrics
      include Model
      
      model_with_attributes :lyrics_id, :lyrics_body, :track_name, :artist_name
    end
  end
end