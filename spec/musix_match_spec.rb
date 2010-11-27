require 'spec_helper'

describe MusixMatch do
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
  
  it "should call get_chart on Track" do
    params = { :country => 'it' }
    MusixMatch::Models::Track.should_receive(:get_chart).with(params)
    MusixMatch.get_track_chart(params)
  end
  
  it "should call search on InstantLyrics::Search" do
    q = 'artist name track name'
    result = mock(MusixMatch::InstantLyrics::Result)
    lyrics = mock(MusixMatch::Models::Lyrics)
    lyrics.should_receive(:lyrics_body).and_return('lyrics body')
    result.should_receive(:found?).and_return(true)
    result.should_receive(:lyrics).and_return(lyrics)
    MusixMatch::InstantLyrics::Search.should_receive(:search).with(q).and_return(result)
    MusixMatch.i_m_feeling_lucky(q)
  end
  
  it "should call post_feedback on Feedback" do
    track_id = 1
    lyrics_id = 1
    feedback_type = 'wrong_attribution'
    MusixMatch::API::Feedback.should_receive(:post_feedback).with(track_id, lyrics_id, feedback_type)
    MusixMatch.post_feedback(track_id, lyrics_id, feedback_type)
  end
end
