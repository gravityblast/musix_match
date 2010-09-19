require 'json'
require 'httparty'
require 'uri'

musix_match_path = File.dirname(__FILE__)

['api/base',
'models/model',
'models/lyrics',
'lyrics_search_result',
'track_search_result',
'api/search',
'lyrics_find_result',
'track_find_result',
'api/finder',
'models/track'].each do |lib|
  require musix_match_path + '/musix_match/' + lib
end

module MusixMatch
  def self.get_lyrics(*args)
    Models::Lyrics.get(*args)
  end
  
  def self.search_lyrics(*args)
    Models::Lyrics.search(*args)
  end
  
  def self.get_track(*args)
    Models::Track.get(*args)
  end
  
  def self.search_track(*args)
    Models::Track.search(*args)
  end
end