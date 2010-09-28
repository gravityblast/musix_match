require 'spec_helper'

describe MusixMatch::API::Search do
  
  lyrics_search_response  = {'message' => {'body' => {'lyrics_list' => []}, 'header' => { 'status_code' => 200, 'execute_time' => 1, 'available' => 10 }}}
  track_search_response   = {'message' => {'body' => {'track_list' => [] }, 'header' => { 'status_code' => 200, 'execute_time' => 1, 'available' => 10 }}}
  
  it "should initialize a new Search object and call search_lyrics" do
    search = mock(MusixMatch::API::Search)
    MusixMatch::API::Search.should_receive(:new).and_return(search)
    options = { :q_artist => 'artist name' }
    search.should_receive(:search_lyrics).with(options)
    MusixMatch::API::Search.search_lyrics(options)
  end
  
  it "should call get with lyrics.search and initialize a LyricsSearchResult object" do    
    search = MusixMatch::API::Search.new
    options = { :q_artist => 'artist name' }
    search.should_receive(:get).with('lyrics.search', options).and_return(lyrics_search_response)
    MusixMatch::LyricsSearchResult.should_receive(:new).with(lyrics_search_response)
    search.search_lyrics(options)
  end
  
  it "should initialize a new Search object and call search_track" do
    search = mock(MusixMatch::API::Search)
    MusixMatch::API::Search.should_receive(:new).and_return(search)
    options = { :q_artist => 'artist name' }
    search.should_receive(:search_track).with(options)
    MusixMatch::API::Search.search_track(options)
  end
  
  it "should call get with track.search and initialize a TrackSearchResult" do
    search = MusixMatch::API::Search.new
    options = { :q_artist => 'artist name' }    
    search.should_receive(:get).with('track.search', options).and_return(track_search_response)
    MusixMatch::TrackSearchResult.should_receive(:new).with(track_search_response)
    search.search_track(options)
  end    
end