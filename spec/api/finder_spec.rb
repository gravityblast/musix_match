require 'spec_helper'

describe MusixMatch::API::Finder do
  
  lyrics_find_response  = {'message' => {'body' => {'lyrics_list' => [{'lyrics' => {}}]}, 'header' => { 'status_code' => 200, 'execute_time' => 1 }}}
  track_find_response   = {'message' => {'body' => {'track_list'  => [{'track' => {}}] }, 'header' => { 'status_code' => 200, 'execute_time' => 1 }}}
  
  it "should initialize a new Finder object and call find_lyrics" do
    finder = mock(MusixMatch::API::Finder)
    MusixMatch::API::Finder.should_receive(:new).and_return(finder)
    lyrics_id = 1
    finder.should_receive(:find_lyrics).with(lyrics_id)
    MusixMatch::API::Finder.find_lyrics(lyrics_id)
  end
  
  it "should call get with lyrics.get and initialize a LyricsFindResult object" do    
    finder = MusixMatch::API::Finder.new
    lyrics_id = 1
    finder.should_receive(:get).with('lyrics.get', :lyrics_id => lyrics_id).and_return(lyrics_find_response)
    MusixMatch::LyricsFindResult.should_receive(:new).with(lyrics_find_response)
    finder.find_lyrics(lyrics_id)
  end
  
  it "should initialize a new Finder object and call find_track" do
    finder = mock(MusixMatch::API::Finder)
    MusixMatch::API::Finder.should_receive(:new).and_return(finder)
    track_id = 1
    finder.should_receive(:find_track).with(track_id)
    MusixMatch::API::Finder.find_track(track_id)
  end
  
  it "should call get with track.get and initialize a TrackFinderResult" do
    finder = MusixMatch::API::Finder.new
    track_id = 1
    finder.should_receive(:get).with('track.get', :track_id => track_id).and_return(track_find_response)
    MusixMatch::TrackFindResult.should_receive(:new).with(track_find_response)
    finder.find_track(track_id)
  end    
end