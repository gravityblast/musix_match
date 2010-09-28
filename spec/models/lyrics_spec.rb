require 'spec_helper'

describe MusixMatch::Models::Lyrics do
  it 'should call search_lyrics on Search class' do
    params = { :q_artist => 'artist name' }
    MusixMatch::API::Search.should_receive(:search_lyrics).with(params)
    MusixMatch::Models::Lyrics.search(params)
  end
  
  it 'should call find_lyrics on Finder class' do
    lyrics_id = 1
    MusixMatch::API::Finder.should_receive(:find_lyrics).with(lyrics_id)
    MusixMatch::Models::Lyrics.get(lyrics_id)
  end
  
  context 'when created' do
    it 'should have the search class method' do
      MusixMatch::Models::Lyrics.should respond_to(:search)
    end
    
    it 'should have the get class method' do
      MusixMatch::Models::Lyrics.should respond_to(:get)
    end
  end
    
  context 'when initialized' do
    it 'should set lyrics_id' do
      lyrics_id = 1
      lyrics = MusixMatch::Models::Lyrics.new('lyrics_id' => lyrics_id)
      lyrics.lyrics_id.should == lyrics_id
    end
    
    it 'should set lyrics_body' do
      lyrics_body = "lyrics body"
      lyrics = MusixMatch::Models::Lyrics.new('lyrics_body' => lyrics_body)
      lyrics.lyrics_body.should == lyrics_body
    end
    
    it 'should set track_name' do
      track_name = "track name"
      lyrics = MusixMatch::Models::Lyrics.new('track_name' => track_name)
      lyrics.track_name.should == track_name
    end
    
    it 'should set artist_name' do
      artist_name = "artist name"
      lyrics = MusixMatch::Models::Lyrics.new('artist_name' => artist_name)
      lyrics.artist_name.should == artist_name
    end
  end
end