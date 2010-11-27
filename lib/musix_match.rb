require 'uri'

gem_libs = %w(json httparty)
begin
  gem_libs.each{|lib| require lib}
rescue LoadError
  require 'rubygems'
  gem_libs.each{|lib| require lib}
end

musix_match_path = File.dirname(__FILE__)

['api/base',
'models/model',
'models/lyrics',
'lyrics_search_result',
'track_search_result',
'api/search',
'lyrics_find_result',
'track_find_result',
'feedback_result',
'api/finder',
'api/track_chart',
'api/feedback',
'models/track',
'instant_lyrics'].each do |lib|
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
  
  def self.get_track_chart(*args)
    Models::Track.get_chart(*args)
  end
  
  def self.i_m_feeling_lucky(q)
    result = MusixMatch::InstantLyrics::Search.search(q)
    result.found? ? result.lyrics.lyrics_body : 'Lyrics not found'
  end
  
  def self.post_feedback(track_id, lyrics_id, feedback_type)
    API::Feedback.post_feedback(track_id, lyrics_id, feedback_type)
  end
end