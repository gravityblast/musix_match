module MusixMatch
  module Models
    class Lyrics
      include Model
      
      model_with_attributes :lyrics_id, :lyrics_body, :lyrics_language, :script_tracking_url, :lyrics_copyright, :track_name, :artist_name
    end
  end
end