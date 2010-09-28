require 'spec_helper'

describe MusixMatch::Models::Track do
  it 'should call search_track on Search class' do
    params = { :q_artist => 'artist name' }
    MusixMatch::API::Search.should_receive(:search_track).with(params)
    MusixMatch::Models::Track.search(params)
  end
  
  it 'should call find_track on Finder class' do
    track_id = 1
    MusixMatch::API::Finder.should_receive(:find_track).with(track_id)
    MusixMatch::Models::Track.get(track_id)
  end
  
  context 'when created' do
    it 'should have the search class method' do
      MusixMatch::Models::Track.should respond_to(:search)
    end
    
    it 'should have the get class method' do
      MusixMatch::Models::Track.should respond_to(:get)
    end
  end
  
  context 'when initialized' do
    it 'should set track_id' do
      track_id = 1
      track = MusixMatch::Models::Track.new('track_id' => track_id)
      track.track_id.should == track_id
    end
    
    it 'should set track_mbid' do
      track_mbid = 1
      track = MusixMatch::Models::Track.new('track_mbid' => track_mbid)
      track.track_mbid.should == track_mbid
    end
    
    it 'should set lyrics_id' do
      lyrics_id = 1
      track = MusixMatch::Models::Track.new('lyrics_id' => lyrics_id)
      track.lyrics_id.should == lyrics_id
    end
    
    it 'should set track_name' do
      track_name = "track name"
      track = MusixMatch::Models::Track.new('track_name' => track_name)
      track.track_name.should == track_name
    end
    
    it 'should set artist_id' do
      artist_id = 1
      track = MusixMatch::Models::Track.new('artist_id' => artist_id)
      track.artist_id.should == artist_id
    end
    
    it 'should set artist_mbid' do
      artist_mbid = 1
      track = MusixMatch::Models::Track.new('artist_mbid' => artist_mbid)
      track.artist_mbid.should == artist_mbid
    end
    
    it 'should set artist_name' do
      artist_name = "artist name"
      track = MusixMatch::Models::Track.new('artist_name' => artist_name)
      track.artist_name.should == artist_name
    end
  end
end