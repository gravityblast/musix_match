require 'spec_helper'

describe 'MusixMatch' do
  it "should call get on Lyrics" do
    lyrics_id = 1
    MusixMatch::Models::Lyrics.should_receive(:get).with(lyrics_id)
    MusixMatch.get_lyrics(lyrics_id)
  end
  
  it "should call get on Track" do
    track_id = 1
    MusixMatch::Models::Track.should_receive(:get).with(track_id)
    MusixMatch.get_track(track_id)
  end
  
  it "should call search on Lyrics" do
    params = { :q_artist => 'artist name' }
    MusixMatch::Models::Lyrics.should_receive(:search).with(params)
    MusixMatch.search_lyrics(params)
  end
  
  it "should call search on Track" do
    params = { :q_artist => 'artist name' }
    MusixMatch::Models::Track.should_receive(:search).with(params)
    MusixMatch.search_track(params)
  end
end
